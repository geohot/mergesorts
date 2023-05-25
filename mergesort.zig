const std = @import("std");

pub fn main() !void {
    var a = [_]i32{ 5, 9, 1, 3, 4, 6, 6, 3, 2 };
    try mergesort(a[0..]);
    printI32Slice(a[0..]);
}

fn mergesort(a: []i32) !void {
    if (a.len <= 1) return;
    const allocator = std.heap.page_allocator;
    var left = try allocator.alloc(i32, a.len / 2);
    defer allocator.free(left);
    var i: usize = 0;
    for (left) |*num| {
        num.* = a[i];
        i += 1;
    }
    var right = try allocator.alloc(i32, a.len - a.len / 2);
    defer allocator.free(right);
    for (right) |*num| {
        num.* = a[i];
        i += 1;
    }
    try mergesort(left);
    try mergesort(right);
    var j: usize = 0;
    var k: usize = 0;
    for (a) |*num| {
        if (j >= left.len) {
            num.* = right[k];
            k += 1;
        } else if (k >= right.len) {
            num.* = left[j];
            j += 1;
        } else if (left[j] < right[k]) {
            num.* = left[j];
            j += 1;
        } else {
            num.* = right[k];
            k += 1;
        }
    }
}

fn printI32Slice(a: []const i32) void {
    for (a) |num| {
        std.debug.print("{} ", .{num});
    }
}
