# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.IoT1ClickDevices do
  @moduledoc """
  Describes all of the AWS IoT 1-Click device-related API operations for the
  service.

  Also provides sample requests, responses, and errors for the supported web
  services

  protocols.
  """

  @doc """
  Adds device(s) to your account (i.e., claim one or more devices) if and
  only if you

  received a claim code with the device(s).
  """
  def claim_devices_by_claim_code(client, claim_code, input, options \\ []) do
    path_ = "/claims/#{URI.encode(claim_code)}"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, 200)
  end

  @doc """
  Given a device ID, returns a DescribeDeviceResponse object describing the

  details of the device.
  """
  def describe_device(client, device_id, options \\ []) do
    path_ = "/devices/#{URI.encode(device_id)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Given a device ID, finalizes the claim request for the associated device.

  <note>

  Claiming a device consists of initiating a claim, then publishing a device
  event,

  and finalizing the claim. For a device of type button, a device event can

  be published by simply clicking the device.

  </note>
  """
  def finalize_device_claim(client, device_id, input, options \\ []) do
    path_ = "/devices/#{URI.encode(device_id)}/finalize-claim"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, 200)
  end

  @doc """
  Given a device ID, returns the invokable methods associated with the
  device.
  """
  def get_device_methods(client, device_id, options \\ []) do
    path_ = "/devices/#{URI.encode(device_id)}/methods"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Given a device ID, initiates a claim request for the associated device.

  <note>

  Claiming a device consists of initiating a claim, then publishing a device
  event,

  and finalizing the claim. For a device of type button, a device event can

  be published by simply clicking the device.

  </note>
  """
  def initiate_device_claim(client, device_id, input, options \\ []) do
    path_ = "/devices/#{URI.encode(device_id)}/initiate-claim"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, 200)
  end

  @doc """
  Given a device ID, issues a request to invoke a named device method (with
  possible

  parameters). See the "Example POST" code snippet below.
  """
  def invoke_device_method(client, device_id, input, options \\ []) do
    path_ = "/devices/#{URI.encode(device_id)}/methods"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Using a device ID, returns a DeviceEventsResponse object containing an

  array of events for the device.
  """
  def list_device_events(client, device_id, from_time_stamp, max_results \\ nil, next_token \\ nil, to_time_stamp, options \\ []) do
    path_ = "/devices/#{URI.encode(device_id)}/events"
    headers = []
    query_ = []
    query_ = if !is_nil(to_time_stamp) do
      [{"toTimeStamp", to_time_stamp} | query_]
    else
      query_
    end
    query_ = if !is_nil(next_token) do
      [{"nextToken", next_token} | query_]
    else
      query_
    end
    query_ = if !is_nil(max_results) do
      [{"maxResults", max_results} | query_]
    else
      query_
    end
    query_ = if !is_nil(from_time_stamp) do
      [{"fromTimeStamp", from_time_stamp} | query_]
    else
      query_
    end
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Lists the 1-Click compatible devices associated with your AWS account.
  """
  def list_devices(client, device_type \\ nil, max_results \\ nil, next_token \\ nil, options \\ []) do
    path_ = "/devices"
    headers = []
    query_ = []
    query_ = if !is_nil(next_token) do
      [{"nextToken", next_token} | query_]
    else
      query_
    end
    query_ = if !is_nil(max_results) do
      [{"maxResults", max_results} | query_]
    else
      query_
    end
    query_ = if !is_nil(device_type) do
      [{"deviceType", device_type} | query_]
    else
      query_
    end
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Lists the tags associated with the specified resource ARN.
  """
  def list_tags_for_resource(client, resource_arn, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Adds or updates the tags associated with the resource ARN. See [AWS IoT
  1-Click Service
  Limits](https://docs.aws.amazon.com/iot-1-click/latest/developerguide/1click-appendix.html#1click-limits)
  for the maximum number of tags allowed per

  resource.
  """
  def tag_resource(client, resource_arn, input, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 204)
  end

  @doc """
  Disassociates a device from your AWS account using its device ID.
  """
  def unclaim_device(client, device_id, input, options \\ []) do
    path_ = "/devices/#{URI.encode(device_id)}/unclaim"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, 200)
  end

  @doc """
  Using tag keys, deletes the tags (key/value pairs) associated with the
  specified

  resource ARN.
  """
  def untag_resource(client, resource_arn, input, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    {query_, input} =
      [
        {"TagKeys", "tagKeys"},
      ]
      |> AWS.Request.build_params(input)
    request(client, :delete, path_, query_, headers, input, options, 204)
  end

  @doc """
  Using a Boolean value (true or false), this operation

  enables or disables the device given a device ID.
  """
  def update_device_state(client, device_id, input, options \\ []) do
    path_ = "/devices/#{URI.encode(device_id)}/state"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, 200)
  end

  @spec request(AWS.Client.t(), binary(), binary(), list(), list(), map(), list(), pos_integer()) ::
          {:ok, Poison.Parser.t(), Poison.Response.t()}
          | {:error, Poison.Parser.t()}
          | {:error, HTTPoison.Error.t()}
  defp request(client, method, path, query, headers, input, options, success_status_code) do
    client = %{client | service: "iot1click"}
    host = build_host("devices.iot1click", client)
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
