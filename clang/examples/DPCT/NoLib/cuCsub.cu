#include <cuComplex.h>

__global__ void test(cuDoubleComplex c1, cuDoubleComplex c2) {
  // Start
  cuCsub(c1 /*cuDoubleComplex*/, c2 /*cuDoubleComplex*/);
  // End
}
