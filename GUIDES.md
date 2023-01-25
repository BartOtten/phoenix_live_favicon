
# Guides
This pages includes guides for common use cases.


## Dynamic favicon path
This example will explain how to use a placeholder in the favicons' href-attribute to
switch between the default, a green and a red favicon.


### 1. Add one or multiple sizes of your favicon to your applications' main template. 
```html
<!-- in /templates/layout/root.html.heex -->
<link rel="icon" type="image/png" href="images/favs/favicon-32x32.png">
<link rel="icon" type="image/png" href="images/favs/favicon-16x16.png">
```

This is the default favicon.


### 2. Add placeholder attributes to the link elements from step 1
In order to use a dynamic value you need to add a 'template' for each attribute
using the dynamic value. For this we add a dataset attribute. The naming scheme 
is `data-dynamic-[attr]`. 

The result for having a placeholder named `subfolder` 
in the `href`-attribute is:

```heex
<link [...] data-dynamic-href="images/favs/{subfolder}/favicon-32x32.png">
<link [...] data-dynamic-href="images/favs/{subfolder}/favicon-16x16.png">
```


### 3. Set the dynamic value from your code
You can set the value of the placeholder using `set_dynamic/2`.

```diff
socket =
  socket
+  |> Phx.Live.Favicon.set_dynamic("subfolder", "green")
```

The resulting HTML in the browser will now be:

```html
<link [...] href="images/favs/green/favicon-32x32.png">
<link [...] href="images/favs/green/favicon-16x16.png">
```

Changing the favicon to red:

```diff
socket =
  socket
+  |> Phx.Live.Favicon.set_dynamic("subfolder", "red")
```

Results in:
```html
<link [...] href="images/favs/red/favicon-32x32.png">
<link [...] href="images/favs/red/favicon-16x16.png">
```

To reset the favicon to it's default call `Favicon.reset(socket)`.

---


## Dynamic SVG
While dynamic paths allows you to switch favicons, those are still
not dynamic on their own. For this you need a vector favicon (SVG).

This example will explain how to use a placeholder in the favicons' href-attribute to
show a counter and change the background color of the counter.


### 1. Add the SVG favicon to your applications' main template
```html
<link [...] 
   href="data:image/svg+xml,
   <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'> 
      <circle cx='50' cy='50' r='50' fill='SteelBlue' />
      <text x='50%' y='50%' [...]>
        0
      </text>
  </svg>
">
```


### 2. Add placeholder attributes to the link elements from step 1
In order to use a dynamic value you need to add a 'template' for each attribute
using the dynamic value. For this we add a dataset attribute. The naming scheme 
is `data-dynamic-[attr]`. 

In this example we add two placeholder: `counter` and `counter_background`

```diff
<link [...] 
+   data-dynamic-href="data:image/svg+xml,
+     <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'> 
+       <circle cx='50' cy='50' r='50' fill='{counter_background}' />
+       <text x='50%' y='50%' [...]>
+         {counter}
+       </text>
+     </svg>
+  "
>
```


### 3. Set the dynamic values from your code
```diff
count = socket.assigns.counter

socket =
  socket
+  |> Phx.Live.Favicon.set_dynamic("counter", counter + 1)
+  |> Phx.Live.Favicon.set_dynamic("count_background", "DarkOrange")
```

---


## Mixing PNG and SVG
Mixing different types of favicons is not recommended but has it's use case. It
allows you to have multiple sizes defined for the PNG favicon while still being
able to use a dynamic SVG favicon.

  > #### Note {: .info}
  > Consider combining a single `<link rel='icon'>` with a `ico` file. This allows
  > you to manipulate one single elements' `type` and `href`; greatly reducing complexity.

This example will explain how to make use of the behaviour of browsers to
switch between PNG and SVG favicons.

### 1. Add the favicons to your applications' main template
Follow the first two steps from the two chapters above. Make sure the SVG
favicon comes last. The end result should be both PNG and SVG favicons
in your main template.


### 2. Add classnames to your favicons
Add class names your your favicons specifying which types they are. For example:

```html
<link class="png" href="images/favs/red/favicon-32x32.png" [...]>
<link class="png" href="images/favs/red/favicon-16x16.png" [...]>
<link class="svg" href="data:image/svg+html....." [...]>
```

Now we can target different types of the favicon by using the class names.


### 3. Let the browser use the SVG
Browsers automatically pick a favicon to use when multiple options
are provided. We exploit this behaviour to switch between PNG and SVG.

Set the `href` of the favicons with `png` class name to a null value.
You will need to use the underlying lib Phoenix Live Head which you
already have installed as Phoenix Live favicon depends on it.

```
socket =
  socket
  |> Phx.Live.Head.push(".png", :set, :href, "")
  |> Fav.set_dynamic("counter", counter + 1)
  |> Fav.set_dynamic("counter_bg", DarkOrange")
```

The browser will reconsider all favicon options and pick the SVG as it's the 
only one with a valid value.


### 4. Let the browser use the PNG
To switch back to the PNG favicons set their `href` to a valid
value. Have a look at `snap/3` and `restore/3` to make this process
easier.


