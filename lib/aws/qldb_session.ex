# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.QLDBSession do
  @moduledoc """
  The transactional data APIs for Amazon QLDB

  <note> Instead of interacting directly with this API, we recommend that you
  use the Amazon QLDB Driver or the QLDB Shell to execute data transactions
  on a ledger.

  <ul> <li> If you are working with an AWS SDK, use the QLDB Driver. The
  driver provides a high-level abstraction layer above this `qldbsession`
  data plane and manages `SendCommand` API calls for you. For information and
  a list of supported programming languages, see [Getting started with the
  driver](https://docs.aws.amazon.com/qldb/latest/developerguide/getting-started-driver.html)
  in the *Amazon QLDB Developer Guide*.

  </li> <li> If you are working with the AWS Command Line Interface (AWS
  CLI), use the QLDB Shell. The shell is a command line interface that uses
  the QLDB Driver to interact with a ledger. For information, see [Accessing
  Amazon QLDB using the QLDB
  Shell](https://docs.aws.amazon.com/qldb/latest/developerguide/data-shell.html).

  </li> </ul> </note>
  """

  @doc """
  Sends a command to an Amazon QLDB ledger.

  <note> Instead of interacting directly with this API, we recommend that you
  use the Amazon QLDB Driver or the QLDB Shell to execute data transactions
  on a ledger.

  <ul> <li> If you are working with an AWS SDK, use the QLDB Driver. The
  driver provides a high-level abstraction layer above this `qldbsession`
  data plane and manages `SendCommand` API calls for you. For information and
  a list of supported programming languages, see [Getting started with the
  driver](https://docs.aws.amazon.com/qldb/latest/developerguide/getting-started-driver.html)
  in the *Amazon QLDB Developer Guide*.

  </li> <li> If you are working with the AWS Command Line Interface (AWS
  CLI), use the QLDB Shell. The shell is a command line interface that uses
  the QLDB Driver to interact with a ledger. For information, see [Accessing
  Amazon QLDB using the QLDB
  Shell](https://docs.aws.amazon.com/qldb/latest/developerguide/data-shell.html).

  </li> </ul> </note>
  """
  def send_command(client, input, options \\ []) do
    request(client, "SendCommand", input, options)
  end

  @spec request(AWS.Client.t(), binary(), map(), list()) ::
          {:ok, Poison.Parser.t() | nil, Poison.Response.t()}
          | {:error, Poison.Parser.t()}
          | {:error, HTTPoison.Error.t()}
  defp request(client, action, input, options) do
    client = %{client | service: "qldb"}
    host = build_host("session.qldb", client)
    url = build_url(host, client)

    headers = [
      {"Host", host},
      {"Content-Type", "application/x-amz-json-1.0"},
      {"X-Amz-Target", "QLDBSession.#{action}"}
    ]

    payload = Poison.Encoder.encode(input, %{})
    headers = AWS.Request.sign_v4(client, "POST", url, headers, payload)

    case HTTPoison.post(url, payload, headers, options) do
      {:ok, %HTTPoison.Response{status_code: 200, body: ""} = response} ->
        {:ok, nil, response}

      {:ok, %HTTPoison.Response{status_code: 200, body: body} = response} ->
        {:ok, Poison.Parser.parse!(body, %{}), response}

      {:ok, %HTTPoison.Response{body: body}} ->
        error = Poison.Parser.parse!(body, %{})
        {:error, error}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %HTTPoison.Error{reason: reason}}
    end
  end

  defp build_host(_endpoint_prefix, %{region: "local"}) do
    "localhost"
  end
  defp build_host(endpoint_prefix, %{region: region, endpoint: endpoint}) do
    "#{endpoint_prefix}.#{region}.#{endpoint}"
  end

  defp build_url(host, %{:proto => proto, :port => port}) do
    "#{proto}://#{host}:#{port}/"
  end
end
