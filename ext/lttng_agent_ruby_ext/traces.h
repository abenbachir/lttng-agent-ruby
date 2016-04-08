#undef TRACEPOINT_PROVIDER
#define TRACEPOINT_PROVIDER ruby_log
#
#undef TRACEPOINT_INCLUDE
#define TRACEPOINT_INCLUDE "./traces.h"

#if !defined(_TRACEPOINT_UST_RUBY_LOG) || defined(TRACEPOINT_HEADER_MULTI_READ)
#define _TRACEPOINT_UST_RUBY_LOG

#include "ruby.h"
#include <lttng/tracepoint.h>



TRACEPOINT_EVENT(ruby_log,
                 debug,
                 TP_ARGS(const char*, t_sourcefile,
                         int, t_sourceline,
                         char*, t_message),
                 TP_FIELDS(ctf_string(sourcefile, t_sourcefile)
                           ctf_integer(int, sourceline, t_sourceline)
                           ctf_string(message, t_message)))
TRACEPOINT_LOGLEVEL(ruby_log, debug, TRACE_DEBUG)



TRACEPOINT_EVENT(ruby_log,
                 info,
                 TP_ARGS(const char*, t_sourcefile,
                         int, t_sourceline,
                         char*, t_message),
                 TP_FIELDS(ctf_string(sourcefile, t_sourcefile)
                           ctf_integer(int, sourceline, t_sourceline)
                           ctf_string(message, t_message)))
TRACEPOINT_LOGLEVEL(ruby_log, info, TRACE_INFO)



TRACEPOINT_EVENT(ruby_log,
                 notice,
                 TP_ARGS(const char*, t_sourcefile,
                         int, t_sourceline,
                         char*, t_message),
                 TP_FIELDS(ctf_string(sourcefile, t_sourcefile)
                           ctf_integer(int, sourceline, t_sourceline)
                           ctf_string(message, t_message)))
TRACEPOINT_LOGLEVEL(ruby_log, notice, TRACE_NOTICE)



TRACEPOINT_EVENT(ruby_log,
                 warning,
                 TP_ARGS(const char*, t_sourcefile,
                         int, t_sourceline,
                         char*, t_message),
                 TP_FIELDS(ctf_string(sourcefile, t_sourcefile)
                           ctf_integer(int, sourceline, t_sourceline)
                           ctf_string(message, t_message)))
TRACEPOINT_LOGLEVEL(ruby_log, warning, TRACE_WARNING)



TRACEPOINT_EVENT(ruby_log,
                 err,
                 TP_ARGS(const char*, t_sourcefile,
                         int, t_sourceline,
                         char*, t_message),
                 TP_FIELDS(ctf_string(sourcefile, t_sourcefile)
                           ctf_integer(int, sourceline, t_sourceline)
                           ctf_string(message, t_message)))
TRACEPOINT_LOGLEVEL(ruby_log, err, TRACE_ERR)



TRACEPOINT_EVENT(ruby_log,
                 crit,
                 TP_ARGS(const char*, t_sourcefile,
                         int, t_sourceline,
                         char*, t_message),
                 TP_FIELDS(ctf_string(sourcefile, t_sourcefile)
                           ctf_integer(int, sourceline, t_sourceline)
                           ctf_string(message, t_message)))
TRACEPOINT_LOGLEVEL(ruby_log, crit, TRACE_CRIT)



TRACEPOINT_EVENT(ruby_log,
                 alert,
                 TP_ARGS(const char*, t_sourcefile,
                         int, t_sourceline,
                         char*, t_message),
                 TP_FIELDS(ctf_string(sourcefile, t_sourcefile)
                           ctf_integer(int, sourceline, t_sourceline)
                           ctf_string(message, t_message)))
TRACEPOINT_LOGLEVEL(ruby_log, alert, TRACE_ALERT)



TRACEPOINT_EVENT(ruby_log,
                 emerg,
                 TP_ARGS(const char*, t_sourcefile,
                         int, t_sourceline,
                         char*, t_message),
                 TP_FIELDS(ctf_string(sourcefile, t_sourcefile)
                           ctf_integer(int, sourceline, t_sourceline)
                           ctf_string(message, t_message)))
TRACEPOINT_LOGLEVEL(ruby_log, emerg, TRACE_EMERG)



#endif /* _TRACEPOINT_UST_RUBY_LOG */

/* This part must be outside ifdef protection */
#include <lttng/tracepoint-event.h>

