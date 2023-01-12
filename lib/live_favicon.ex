defmodule Phx.Live.Favicon do
  alias Phoenix.LiveView.Socket
  alias Phx.Live.Head

  @moduledoc """
  Provides commands for manipulating the Favicon of Phoenix Live View applications
  while minimizing data over the wire.

  The available command actions support a variety of utility operations useful for
  Favicon manipulation. Such as setting or removing tag attributes and
  adding or removing CSS classes for vector (SVG) favicons.

  The elements selected for manipulation are found by Javascript client code
  `document.querySelectorAll("link[rel*=icon]")`.
  """

  @type attr :: atom() | binary()
  @type variant :: String.t()
  @type value :: String.t()
  @type class_name :: String.t()
  @type key :: String.t()

  @doc """
  Set the value of the `{dynamic}` part of the `attribute` to `variant` on
  all favicon link elements

  ## Dynamic attributes

  To define a dynamic attribute, the element in the template must have a `data-dynamic-[attr]`
  attribute with a value containing the placeholder notation `{dynamic}`.

  **Example**
  ```html
  <link rel='icon' href="default_fav.png" data-dynamic-href="favs/{dynamic}/fav-16x16.png">
  ```

  When an event is pushed with `set_dynamic(:href, "new_message")` the result wil look like:

  ```html
  <link rel='icon' href="favs/new_message/fav-16x16.png">
  ```
  """
  @spec set_dynamic(Socket.t(), attr, variant) :: Socket.t()
  def set_dynamic(socket, attr, variant),
    do: Head.push(socket, "link[rel*='icon']", :dynamic, attr, variant)

  @doc """
  Set a new `value` to the `attribute` on all favicon link elements
  """
  @spec set_attr(Socket.t(), attr, value) :: Socket.t()
  def set_attr(socket, attr, value),
    do: Head.push(socket, "link[rel*='icon']", :set, attr, value)

  @doc """
  Remove an `attribute` from all favicon link elements
  """
  @spec remove_attr(Socket.t(), attr) :: Socket.t()
  def remove_attr(socket, attr),
    do: Head.push(socket, "link[rel*='icon']", :remove, attr)

  @doc """
  Reset an `attribute` to it's initial value on all favicon link elements
  """
  @spec reset_attr(Socket.t(), attr) :: Socket.t()
  def reset_attr(socket, attr),
    do: Head.reset(socket, "link[rel*='icon']", attr)

  @doc """
   Backup an `attribute` from all favicon link element under `key`
  """
  @spec backup_attr(Socket.t(), key, attr) :: map
  def backup_attr(socket, key, attr), do: Head.backup(socket, "link[rel*='icon']", key, attr)

  @doc """
   Restore an `attribute` backup under `key`
  """
  @spec restore_attr(Socket.t(), key, attr) :: map
  def restore_attr(socket, key, attr), do: Head.restore(socket, "link[rel*='icon']", key, attr)

  @doc """
  Set the `class` on all favicon link elements
  """
  @spec set_class(Socket.t(), class_name) :: Socket.t()
  def set_class(socket, class) when is_binary(class),
    do: Head.push(socket, "link[rel*='icon']", :set, "class", class)

  @doc """
  Add a `class_name` to the list of classes on all favicon link elements
  """
  @spec add_class(Socket.t(), class_name) :: Socket.t()
  def add_class(socket, class_name) when is_binary(class_name),
    do: Head.push(socket, "link[rel*='icon']", :add, "class", class_name)

  @doc """
  Remove a `class_name` from the list of classes on all favicon link elements
  """
  @spec remove_class(Socket.t(), class_name) :: Socket.t()
  def remove_class(socket, class_name) when is_binary(class_name),
    do: Head.push(socket, "link[rel*='icon']", :remove, "class", class_name)

  @doc """
  Toggle `class_name` on all favicon link elements
  """
  @spec toggle_class(Socket.t(), class_name) :: Socket.t()
  def toggle_class(socket, class_name) when is_binary(class_name),
    do: Head.push(socket, "link[rel*='icon']", :toggle, "class", class_name)

  @doc """
  Reset all favicon link elements to their initial values
  """
  @spec reset(Socket.t()) :: map
  def reset(socket), do: Head.reset(socket, "link[rel*='icon']")

  @doc """
   Backup all favicon link element attribute values under `key`
  """
  @spec backup(Socket.t(), key) :: map
  def backup(socket, key), do: Head.backup(socket, "link[rel*='icon']", key)

  @doc """
    Restore backup under `key`
  """
  @spec restore(Socket.t(), key) :: map
  def restore(socket, key), do: Head.restore(socket, "link[rel*='icon']", key)
end
