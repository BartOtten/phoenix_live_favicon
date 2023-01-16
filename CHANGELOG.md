# Changelog

## v0.2.0

### Features

#### Create and restore snapshots
The new operations `snap` and `restore` make it possible to store
the result of many operations under a chosen `name` and restore it
at a later time by only sending the snapshot name over the wire.

* `snap` - Takes a snapshot of all attribute values.
* `restore` - Applies a snapshot to selected elements

In the Live Favicon Example application it is used to send all changes required to switch
between an dynamic SVG counter and static PNG message-icon once, and toggle the
state between them; creating a flashing notification. As it also makes a snapshot of the state
*before* the favicon begins to flash, the icon on the page can be restored to it's
value as soon as the user read the unread messages.

#### Use multiple placeholders
You can now use multiple custom named placeholders, instead of only one `{dynamic}` per attribute.

### Fixes
* Unstable order of change execution when using multiple queries / libs.

### BREAKING
* the attribute value of `dynamic` is now used as name for the target placeholder. As a result, it is not
possible anymore to target a specific attribute. Migration is as easy as using different names per attribute
when necessary.

## v0.1.1

* Breaking: `remove_attr/3` has been replaced by `remove_attr/2`
* Require Phoenix Live Head ~> 0.1.2

## v0.0.1
Initial commit
