import math, sequtils

type
  Tensor*[T] = object
    data*: seq[T]
    size*: seq[int]
    stride*: seq[int]
    offset*: int

proc tensor*[T](size: openArray[int]): Tensor[T] =
  result = Tensor[T]()
  result.size = size.toSeq
  result.stride = newSeq[int](result.size.len)
  result.stride[result.size.len-1] = 1
  for i in 0..<result.size.len-1:
    result.stride[i] = result.size[i+1]
  result.offset = 0
  result.data = newSeq[int](result.size.prod)

proc tensor*[T](size: openArray[int], data: openArray[T]): Tensor[T] =
  result = Tensor[T]()
  result.size = size.toSeq
  result.stride = newSeq[int](result.size.len)
  result.stride[result.size.len-1] = 1
  for i in 0..<result.size.len-1:
    result.stride[i] = result.size[i+1]
  result.offset = 0
  result.data = data.toSeq

proc zeroTensor*[T](size: openArray[int]): Tensor[T] =
  tensor(size)

proc `[]`*[T](x:Tensor[T], args:varargs[untyped]): untyped =
  let _ = getAst(desugar(args))
