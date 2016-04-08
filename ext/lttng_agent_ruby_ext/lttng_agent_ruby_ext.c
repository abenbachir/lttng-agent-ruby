#include <ruby.h>

#define TRACEPOINT_CREATE_PROBES
#define TRACEPOINT_DEFINE
#include "traces.h"




VALUE ruby_lttng_trace_debug(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, debug)) {
      tracepoint(ruby_log, debug, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}

/*  This warrants a little more design before going further... 
VALUE ruby_lttng_trace_back_debug(VALUE self, VALUE level, VALUE mesg) {
  if (tracepoint_etabled(ruby_log, debug)) {
    loc = location_ptr(...);
    int linenum = location_lineno(loc);
    char* label = StringValuePtr(location_label_m(loc));
    char* path = StringValuePtr(location_absolute_path_m(loc));
    tracepoint(ruby_log, debug_bt, level, linenum, label, path, StringValuePtr(mesg));
  }
  return(Qnil);
}
*/



VALUE ruby_lttng_trace_info(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, info)) {
      tracepoint(ruby_log, info, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}

/*  This warrants a little more design before going further... 
VALUE ruby_lttng_trace_back_info(VALUE self, VALUE level, VALUE mesg) {
  if (tracepoint_etabled(ruby_log, info)) {
    loc = location_ptr(...);
    int linenum = location_lineno(loc);
    char* label = StringValuePtr(location_label_m(loc));
    char* path = StringValuePtr(location_absolute_path_m(loc));
    tracepoint(ruby_log, info_bt, level, linenum, label, path, StringValuePtr(mesg));
  }
  return(Qnil);
}
*/



VALUE ruby_lttng_trace_notice(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, notice)) {
      tracepoint(ruby_log, notice, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}

/*  This warrants a little more design before going further... 
VALUE ruby_lttng_trace_back_notice(VALUE self, VALUE level, VALUE mesg) {
  if (tracepoint_etabled(ruby_log, notice)) {
    loc = location_ptr(...);
    int linenum = location_lineno(loc);
    char* label = StringValuePtr(location_label_m(loc));
    char* path = StringValuePtr(location_absolute_path_m(loc));
    tracepoint(ruby_log, notice_bt, level, linenum, label, path, StringValuePtr(mesg));
  }
  return(Qnil);
}
*/



VALUE ruby_lttng_trace_warning(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, warning)) {
      tracepoint(ruby_log, warning, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}

/*  This warrants a little more design before going further... 
VALUE ruby_lttng_trace_back_warning(VALUE self, VALUE level, VALUE mesg) {
  if (tracepoint_etabled(ruby_log, warning)) {
    loc = location_ptr(...);
    int linenum = location_lineno(loc);
    char* label = StringValuePtr(location_label_m(loc));
    char* path = StringValuePtr(location_absolute_path_m(loc));
    tracepoint(ruby_log, warning_bt, level, linenum, label, path, StringValuePtr(mesg));
  }
  return(Qnil);
}
*/



VALUE ruby_lttng_trace_err(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, err)) {
      tracepoint(ruby_log, err, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}

/*  This warrants a little more design before going further... 
VALUE ruby_lttng_trace_back_err(VALUE self, VALUE level, VALUE mesg) {
  if (tracepoint_etabled(ruby_log, err)) {
    loc = location_ptr(...);
    int linenum = location_lineno(loc);
    char* label = StringValuePtr(location_label_m(loc));
    char* path = StringValuePtr(location_absolute_path_m(loc));
    tracepoint(ruby_log, err_bt, level, linenum, label, path, StringValuePtr(mesg));
  }
  return(Qnil);
}
*/



VALUE ruby_lttng_trace_crit(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, crit)) {
      tracepoint(ruby_log, crit, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}

/*  This warrants a little more design before going further... 
VALUE ruby_lttng_trace_back_crit(VALUE self, VALUE level, VALUE mesg) {
  if (tracepoint_etabled(ruby_log, crit)) {
    loc = location_ptr(...);
    int linenum = location_lineno(loc);
    char* label = StringValuePtr(location_label_m(loc));
    char* path = StringValuePtr(location_absolute_path_m(loc));
    tracepoint(ruby_log, crit_bt, level, linenum, label, path, StringValuePtr(mesg));
  }
  return(Qnil);
}
*/



VALUE ruby_lttng_trace_alert(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, alert)) {
      tracepoint(ruby_log, alert, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}

/*  This warrants a little more design before going further... 
VALUE ruby_lttng_trace_back_alert(VALUE self, VALUE level, VALUE mesg) {
  if (tracepoint_etabled(ruby_log, alert)) {
    loc = location_ptr(...);
    int linenum = location_lineno(loc);
    char* label = StringValuePtr(location_label_m(loc));
    char* path = StringValuePtr(location_absolute_path_m(loc));
    tracepoint(ruby_log, alert_bt, level, linenum, label, path, StringValuePtr(mesg));
  }
  return(Qnil);
}
*/



VALUE ruby_lttng_trace_emerg(VALUE self, VALUE mesg) {
   if (tracepoint_enabled(ruby_log, emerg)) {
      tracepoint(ruby_log, emerg, rb_sourcefile(), rb_sourceline(), StringValuePtr(mesg));
   }
   return(Qnil);
}

/*  This warrants a little more design before going further... 
VALUE ruby_lttng_trace_back_emerg(VALUE self, VALUE level, VALUE mesg) {
  if (tracepoint_etabled(ruby_log, emerg)) {
    loc = location_ptr(...);
    int linenum = location_lineno(loc);
    char* label = StringValuePtr(location_label_m(loc));
    char* path = StringValuePtr(location_absolute_path_m(loc));
    tracepoint(ruby_log, emerg_bt, level, linenum, label, path, StringValuePtr(mesg));
  }
  return(Qnil);
}
*/



VALUE lttng_module;

void Init_lttng_agent_ruby_ext() {
  lttng_module = rb_define_module("LTTng");
  
      rb_define_singleton_method(lttng_module, "debug",    ruby_lttng_trace_debug, 1);
  
      rb_define_singleton_method(lttng_module, "info",    ruby_lttng_trace_info, 1);
  
      rb_define_singleton_method(lttng_module, "notice",    ruby_lttng_trace_notice, 1);
  
      rb_define_singleton_method(lttng_module, "warning",    ruby_lttng_trace_warning, 1);
  
      rb_define_singleton_method(lttng_module, "err",    ruby_lttng_trace_err, 1);
  
      rb_define_singleton_method(lttng_module, "crit",    ruby_lttng_trace_crit, 1);
  
      rb_define_singleton_method(lttng_module, "alert",    ruby_lttng_trace_alert, 1);
  
      rb_define_singleton_method(lttng_module, "emerg",    ruby_lttng_trace_emerg, 1);
  
}

