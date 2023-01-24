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

  @type attr :: Head.attr()
  @type value :: Head.value()
  @type class_name :: String.t()
  @type name :: Head.name()
  @type placeholder :: Head.name()

  @doc """
  Set the `value` of a `{placeholder}` on all favicon link elements

  ## Dynamic attributes / placeholders

  To use a dynamic value for an attribute, the element must have an additional
  `data-dynamic-[attribute]` attribute with a value containing a named
  placeholder. For example: `{sub}` in attribute `href`.

  **Example**
  ```html
    <!-- data-dynamic-href is set -->
    <!-- {sub} is used in it's value -->
  <link rel='icon' href="default_fav.png" data-dynamic-href="favs/{sub}/fav-16x16.png">
  ```

  When an event is pushed with `set_dynamic("sub", "new_message")` the result will be:

  ```html
  <link rel='icon' href="favs/new_message/fav-16x16.png">
  ```
  """
  @spec set_dynamic(Socket.t(), placeholder, value) :: Socket.t()
  def set_dynamic(socket, placeholder, value),
    do: Head.push(socket, "link[rel*='icon']", :dynamic, placeholder, value)

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
   Create a snapshot named `name` of an `attribute` from all favicon link element
  """
  @spec snap_attr(Socket.t(), name, attr) :: map
  def snap_attr(socket, name, attr), do: Head.snap(socket, "link[rel*='icon']", name, attr)

  @doc """
   Restore an `attribute` from snapshot with named `name`
  """
  @spec restore_attr(Socket.t(), name, attr) :: map
  def restore_attr(socket, name, attr), do: Head.restore(socket, "link[rel*='icon']", name, attr)

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
   Make a snapshot with name `name` of all favicon link element attribute values
  """
  @spec snap(Socket.t(), name) :: map
  def snap(socket, name), do: Head.snap(socket, "link[rel*='icon']", name)

  @doc """
    Restore snapshot with `name`
  """
  @spec restore(Socket.t(), name) :: map
  def restore(socket, name), do: Head.restore(socket, "link[rel*='icon']", name)
end
