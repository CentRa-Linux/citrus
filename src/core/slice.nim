
type atIndex* = int | BackwardsIndex

type SteppedSlice* = object
    begin*: int | BackwardsIndex
    end*: int | BackwardsIndex
    step*: int
    begin_to_end*: bool

macro desugar*(args: untyped): void =
    var r = newNimNode(nnkArgList)
    for arg in children(args):
        pass
