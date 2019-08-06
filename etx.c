#include <mruby-sys/ext.h>

// Check whether `mrb_value` is nil, false, or true

_Bool mrb_sys_value_is_nil(mrb_value value) { return mrb_nil_p(value); }

_Bool mrb_sys_value_is_false(mrb_value value) { return mrb_false_p(value); }

_Bool mrb_sys_value_is_true(mrb_value value) { return mrb_true_p(value); }

// Extract pointers from `mrb_value`s

mrb_int mrb_sys_fixnum_to_cint(mrb_value value) { return mrb_fixnum(value); }

mrb_float mrb_sys_float_to_cdouble(mrb_value value) { return mrb_float(value); }

void *mrb_sys_cptr_ptr(mrb_value value) { return mrb_cptr(value); }

struct RBasic *mrb_sys_basic_ptr(mrb_value value) {
  return mrb_basic_ptr(value);
}

struct RObject *mrb_sys_obj_ptr(mrb_value value) {
  return mrb_obj_ptr(value);
}
