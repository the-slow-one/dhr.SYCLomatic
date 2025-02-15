#include <thrust/binary_search.h>
#include <thrust/copy.h>
#include <thrust/device_malloc.h>
#include <thrust/device_vector.h>
#include <thrust/equal.h>
#include <thrust/execution_policy.h>
#include <thrust/extrema.h>
#include <thrust/find.h>
#include <thrust/functional.h>
#include <thrust/gather.h>
#include <thrust/host_vector.h>
#include <thrust/inner_product.h>
#include <thrust/iterator/constant_iterator.h>
#include <thrust/mismatch.h>
#include <thrust/partition.h>
#include <thrust/random.h>
#include <thrust/reduce.h>
#include <thrust/remove.h>
#include <thrust/replace.h>
#include <thrust/reverse.h>
#include <thrust/scatter.h>
#include <thrust/set_operations.h>
#include <thrust/sort.h>
#include <thrust/tabulate.h>
#include <thrust/transform_scan.h>
#include <thrust/uninitialized_copy.h>
#include <thrust/unique.h>
#include <vector>

struct greater_than_four {
  __host__ __device__ bool operator()(int x) const { return x > 4; }
};

void test() {
  const int N = 4;
  int data[4] = {0,5, 3, 7};
  thrust::device_vector<int> device_data(data, data + N);
  thrust::host_vector<int> host_data(data, data + N);

  // Start
  /*1*/ thrust::find_if(data /*InputIterator*/, data + 3 /*InputIterator*/,
                  greater_than_four() /*Predicate*/);
  /*2*/ thrust::find_if(device_data.begin() /*InputIterator*/,
                  device_data.end() /*InputIterator*/,
                  greater_than_four() /*Predicate*/);
  /*3*/ thrust::find_if(host_data.begin() /*InputIterator*/,
                  host_data.end() /*InputIterator*/,
                  greater_than_four() /*Predicate*/);
  /*4*/ thrust::find_if(thrust::host /*const thrust::detail::execution_policy_base<
                                  DerivedPolicy > &*/,
                  data /*InputIterator*/, data + 3 /*InputIterator*/,
                  greater_than_four() /*Predicate*/);
  /*5*/ thrust::find_if(thrust::device /*const thrust::detail::execution_policy_base<
                                    DerivedPolicy > &*/,
                  device_data.begin() /*InputIterator*/,
                  device_data.end() /*InputIterator*/,
                  greater_than_four() /*Predicate*/);
  /*6*/ thrust::find_if(thrust::host /*const thrust::detail::execution_policy_base<
                                  DerivedPolicy > &*/,
                  host_data.begin() /*InputIterator*/,
                  host_data.end() /*InputIterator*/,
                  greater_than_four() /*Predicate*/);
  // End
}
