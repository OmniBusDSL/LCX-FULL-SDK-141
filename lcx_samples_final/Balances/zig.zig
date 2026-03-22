const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.).init(std.heap.page_allocator);
    defer _ = gpa.deinit();

    var client = std.http.Client{ .allocator = gpa.allocator() };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/balances";
    var req = try client.open(.GET, std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    const body = try req.reader().readAllAlloc(gpa.allocator(), 1024 * 1024);
    std.debug.print("{}", .{body});
}
