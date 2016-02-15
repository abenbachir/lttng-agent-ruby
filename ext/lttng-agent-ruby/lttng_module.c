#include <ruby.h>

#define TRACEPOINT_CREATE_PROBES
#define TRACEPOINT_DEFINE
#include "traces.h"




VALUE ruby_lttng_trace_info(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, info)) {
      tracepoint(ruby_log, info, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}


VALUE ruby_lttng_trace_notice(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, notice)) {
      tracepoint(ruby_log, notice, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}


VALUE ruby_lttng_trace_warning(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, warning)) {
      tracepoint(ruby_log, warning, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}


VALUE ruby_lttng_trace_err(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, err)) {
      tracepoint(ruby_log, err, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}


VALUE ruby_lttng_trace_crit(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, crit)) {
      tracepoint(ruby_log, crit, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}


VALUE ruby_lttng_trace_alert(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, alert)) {
      tracepoint(ruby_log, alert, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}


VALUE ruby_lttng_trace_emerg(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, emerg)) {
      tracepoint(ruby_log, emerg, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}


VALUE lttng_module;

void Init_lttng_module() {
  lttng_module = rb_define_module("LTTng");
  
      rb_define_singleton_method(lttng_module, "info",    ruby_lttng_trace_info, 1);
  
      rb_define_singleton_method(lttng_module, "notice",    ruby_lttng_trace_notice, 1);
  
      rb_define_singleton_method(lttng_module, "warning",    ruby_lttng_trace_warning, 1);
  
      rb_define_singleton_method(lttng_module, "err",    ruby_lttng_trace_err, 1);
  
      rb_define_singleton_method(lttng_module, "crit",    ruby_lttng_trace_crit, 1);
  
      rb_define_singleton_method(lttng_module, "alert",    ruby_lttng_trace_alert, 1);
  
      rb_define_singleton_method(lttng_module, "emerg",    ruby_lttng_trace_emerg, 1);
  
}

