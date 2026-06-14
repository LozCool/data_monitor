## 1.1.2

Now includes `MonitoredList` that can be used very succinctly in a data
model to listen to changes in the underlying list using `DataListener`

Updated /example so that it provides a clearer picture of how to use
nested `DataListeners`

Fixed memory leak when a `DataListener` is used in a widget tree that
is later re-generated.

Updated /example documentation so that access to the github repository
is no longer needed to create the Application.
