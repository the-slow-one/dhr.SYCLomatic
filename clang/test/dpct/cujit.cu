// RUN: dpct -out-root %T/USM-restricted %s --cuda-include-path="%cuda-path/include" -- -x cuda
// RUN: FileCheck --match-full-lines --input-file %T/cujit.dp.cpp %s
// RUN: %if build_lit %{icpx -c -fsycl %T/cujit.dp.cpp -o %T/cujit.dp.o %}

void foo(CUjit_target &target, CUjitInputType &type, int vMajor, int vMinor) {
  if (vMajor == 5 && vMinor < 2) {
    target = CU_TARGET_COMPUTE_50;
    type = CU_JIT_INPUT_CUBIN;
  } else {
    target = CU_TARGET_COMPUTE_52;
    type = CU_JIT_INPUT_PTX;
  }
}
