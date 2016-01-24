#include <lttng/tracef.h>
#include "ruby.h"

static VALUE t_tracef(VALUE self, VALUE tracept) {
        tracef("%s", StringValueCStr(tracept));
        return T_NIL;
}

VALUE lttng_module;

void Init_lttng_module() {
  lttng_module = rb_define_module("LTTng");
  rb_define_singleton_method(lttng_module, "tracef", t_tracef, 1);
}

