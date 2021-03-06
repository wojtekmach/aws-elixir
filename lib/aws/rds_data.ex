# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.RDSData do
  @moduledoc """
  Amazon RDS Data Service

  Amazon RDS provides an HTTP endpoint to run SQL statements on an Amazon
  Aurora Serverless DB cluster. To run these statements, you work with the
  Data Service API.

  For more information about the Data Service API, see [Using the Data API
  for Aurora
  Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html)
  in the *Amazon Aurora User Guide*.

  <note> If you have questions or comments related to the Data API, send
  email to
  [Rds-data-api-feedback@amazon.com](mailto:Rds-data-api-feedback@amazon.com).

  </note>
  """

  @doc """
  Runs a batch SQL statement over an array of data.

  You can run bulk update and insert operations for multiple records using a
  DML statement with different parameter sets. Bulk operations can provide a
  significant performance improvement over individual insert and update
  operations.

  <important> If a call isn't part of a transaction because it doesn't
  include the `transactionID` parameter, changes that result from the call
  are committed automatically.

  </important>
  """
  def batch_execute_statement(client, input, options \\ []) do
    path_ = "/BatchExecute"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Starts a SQL transaction.

  <pre>` &lt;important&gt; &lt;p&gt;A transaction can run for a maximum of 24
  hours. A transaction is terminated and rolled back automatically after 24
  hours.&lt;/p&gt; &lt;p&gt;A transaction times out if no calls use its
  transaction ID in three minutes. If a transaction times out before it's
  committed, it's rolled back automatically.&lt;/p&gt; &lt;p&gt;DDL
  statements inside a transaction cause an implicit commit. We recommend that
  you run each DDL statement in a separate
  &lt;code&gt;ExecuteStatement&lt;/code&gt; call with
  &lt;code&gt;continueAfterTimeout&lt;/code&gt; enabled.&lt;/p&gt;
  &lt;/important&gt; `</pre>
  """
  def begin_transaction(client, input, options \\ []) do
    path_ = "/BeginTransaction"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Ends a SQL transaction started with the `BeginTransaction` operation and
  commits the changes.
  """
  def commit_transaction(client, input, options \\ []) do
    path_ = "/CommitTransaction"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Runs one or more SQL statements.

  <important> This operation is deprecated. Use the `BatchExecuteStatement`
  or `ExecuteStatement` operation.

  </important>
  """
  def execute_sql(client, input, options \\ []) do
    path_ = "/ExecuteSql"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Runs a SQL statement against a database.

  <important> If a call isn't part of a transaction because it doesn't
  include the `transactionID` parameter, changes that result from the call
  are committed automatically.

  </important> The response size limit is 1 MB. If the call returns more than
  1 MB of response data, the call is terminated.
  """
  def execute_statement(client, input, options \\ []) do
    path_ = "/Execute"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Performs a rollback of a transaction. Rolling back a transaction cancels
  its changes.
  """
  def rollback_transaction(client, input, options \\ []) do
    path_ = "/RollbackTransaction"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @spec request(AWS.Client.t(), binary(), binary(), list(), list(), map(), list(), pos_integer()) ::
          {:ok, Poison.Parser.t(), Poison.Response.t()}
          | {:error, Poison.Parser.t()}
          | {:error, HTTPoison.Error.t()}
  defp request(client, method, path, query, headers, input, options, success_status_code) do
    client = %{client | service: "rds-data"}
    host = build_host("rds-data", client)
    url = host
    |> build_url(path, client)
    |> add_query(query)

    additional_headers = [{"Host", host}, {"Content-Type", "application/x-amz-json-1.1"}]
    headers = AWS.Request.add_headers(additional_headers, headers)

    payload = encode_payload(input)
    headers = AWS.Request.sign_v4(client, method, url, headers, payload)
    perform_request(method, url, payload, headers, options, success_status_code)
  end

  defp perform_request(method, url, payload, headers, options, nil) do
    case HTTPoison.request(method, url, payload, headers, options) do
      {:ok, %HTTPoison.Response{status_code: 200, body: ""} = response} ->
        {:ok, response}

      {:ok, %HTTPoison.Response{status_code: status_code, body: body} = response}
      when status_code == 200 or status_code == 202 or status_code == 204 ->
        {:ok, Poison.Parser.parse!(body, %{}), response}

      {:ok, %HTTPoison.Response{body: body}} ->
        error = Poison.Parser.parse!(body, %{})
        {:error, error}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %HTTPoison.Error{reason: reason}}
    end
  end

  defp perform_request(method, url, payload, headers, options, success_status_code) do
    case HTTPoison.request(method, url, payload, headers, options) do
      {:ok, %HTTPoison.Response{status_code: ^success_status_code, body: ""} = response} ->
        {:ok, %{}, response}

      {:ok, %HTTPoison.Response{status_code: ^success_status_code, body: body} = response} ->
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

  defp build_url(host, path, %{:proto => proto, :port => port}) do
    "#{proto}://#{host}:#{port}#{path}"
  end

  defp add_query(url, []) do
    url
  end
  defp add_query(url, query) do
    querystring = AWS.Util.encode_query(query)
    "#{url}?#{querystring}"
  end

  defp encode_payload(input) do
    if input != nil, do: Poison.Encoder.encode(input, %{}), else: ""
  end
end
