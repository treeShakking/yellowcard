#[inline]
pub fn mrb_args_key(n1: u32, n2: u32) -> mrb_aspec {
    // ```c
    // #define MRB_ARGS_KEY(n1,n2) ((mrb_aspec)((((n1)&0x1f) << 2) | ((n2)?(1<<1):0)))
    // ```
    if n2 == 0 {
        (n1 & 0x1f) << 2
    } else {
        (n1 & 0x1f) << 2 | 1 << 1
    }
}
