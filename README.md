
# libuv D interface

- Library version: v1.26.0
- Works with -betterC

## An example based on github.com/trevnorris/libuv-examples/simple-thread.c

```d
import core.stdc.stdio;

import deimos.uv;

static uv_thread_t thread;

@nogc nothrow:

extern (C) static void thread_cb(void* arg) {
  printf("hello thread: %d \n", *(cast(int*)arg));
}

extern (C) int main() {
  int userData = 13;
  int r = uv_thread_create(&thread, &thread_cb, &userData);
  //assert(r == 0);

  /* pause execution of this thread until the spawned thread has had
   * time to finish execution. */
  uv_thread_join(&thread);

  return 0;
}
```
