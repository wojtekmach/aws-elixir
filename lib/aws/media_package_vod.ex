# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.MediaPackageVod do
  @moduledoc """
  AWS Elemental MediaPackage VOD
  """

  @doc """
  Creates a new MediaPackage VOD Asset resource.
  """
  def create_asset(client, input, options \\ []) do
    path_ = "/assets"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Creates a new MediaPackage VOD PackagingConfiguration resource.
  """
  def create_packaging_configuration(client, input, options \\ []) do
    path_ = "/packaging_configurations"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Creates a new MediaPackage VOD PackagingGroup resource.
  """
  def create_packaging_group(client, input, options \\ []) do
    path_ = "/packaging_groups"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Deletes an existing MediaPackage VOD Asset resource.
  """
  def delete_asset(client, id, input, options \\ []) do
    path_ = "/assets/#{URI.encode(id)}"
    headers = []
    query_ = []
    request(client, :delete, path_, query_, headers, input, options, 202)
  end

  @doc """
  Deletes a MediaPackage VOD PackagingConfiguration resource.
  """
  def delete_packaging_configuration(client, id, input, options \\ []) do
    path_ = "/packaging_configurations/#{URI.encode(id)}"
    headers = []
    query_ = []
    request(client, :delete, path_, query_, headers, input, options, 202)
  end

  @doc """
  Deletes a MediaPackage VOD PackagingGroup resource.
  """
  def delete_packaging_group(client, id, input, options \\ []) do
    path_ = "/packaging_groups/#{URI.encode(id)}"
    headers = []
    query_ = []
    request(client, :delete, path_, query_, headers, input, options, 202)
  end

  @doc """
  Returns a description of a MediaPackage VOD Asset resource.
  """
  def describe_asset(client, id, options \\ []) do
    path_ = "/assets/#{URI.encode(id)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Returns a description of a MediaPackage VOD PackagingConfiguration
  resource.
  """
  def describe_packaging_configuration(client, id, options \\ []) do
    path_ = "/packaging_configurations/#{URI.encode(id)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Returns a description of a MediaPackage VOD PackagingGroup resource.
  """
  def describe_packaging_group(client, id, options \\ []) do
    path_ = "/packaging_groups/#{URI.encode(id)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Returns a collection of MediaPackage VOD Asset resources.
  """
  def list_assets(client, max_results \\ nil, next_token \\ nil, packaging_group_id \\ nil, options \\ []) do
    path_ = "/assets"
    headers = []
    query_ = []
    query_ = if !is_nil(packaging_group_id) do
      [{"packagingGroupId", packaging_group_id} | query_]
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
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Returns a collection of MediaPackage VOD PackagingConfiguration resources.
  """
  def list_packaging_configurations(client, max_results \\ nil, next_token \\ nil, packaging_group_id \\ nil, options \\ []) do
    path_ = "/packaging_configurations"
    headers = []
    query_ = []
    query_ = if !is_nil(packaging_group_id) do
      [{"packagingGroupId", packaging_group_id} | query_]
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
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Returns a collection of MediaPackage VOD PackagingGroup resources.
  """
  def list_packaging_groups(client, max_results \\ nil, next_token \\ nil, options \\ []) do
    path_ = "/packaging_groups"
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
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Returns a list of the tags assigned to the specified resource.
  """
  def list_tags_for_resource(client, resource_arn, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Adds tags to the specified resource. You can specify one or more tags to
  add.
  """
  def tag_resource(client, resource_arn, input, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 204)
  end

  @doc """
  Removes tags from the specified resource. You can specify one or more tags
  to remove.
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
  Updates a specific packaging group. You can't change the id attribute or
  any other system-generated attributes.
  """
  def update_packaging_group(client, id, input, options \\ []) do
    path_ = "/packaging_groups/#{URI.encode(id)}"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, 200)
  end

  @spec request(AWS.Client.t(), binary(), binary(), list(), list(), map(), list(), pos_integer()) ::
          {:ok, Poison.Parser.t(), Poison.Response.t()}
          | {:error, Poison.Parser.t()}
          | {:error, HTTPoison.Error.t()}
  defp request(client, method, path, query, headers, input, options, success_status_code) do
    client = %{client | service: "mediapackage-vod"}
    host = build_host("mediapackage-vod", client)
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
