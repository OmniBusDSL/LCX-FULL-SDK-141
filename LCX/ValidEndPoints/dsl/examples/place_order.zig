const std = @import("std");


# POST method not supported for zig
pub fn check_order_status(allocator: std.mem.Allocator) !void {
    // GET /api/trading/order/{order_id}
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/trading/order/{order_id}";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

# POST method not supported for zig
pub fn complete_order_flow(allocator: std.mem.Allocator) !void {
    // GET /api/account/balance
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/account/balance";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}



# POST method not supported for zig
# None method not supported for zig
# None method not supported for zig
# None method not supported for zig
# None method not supported for zig
# None method not supported for zig
# None method not supported for zig
# None method not supported for zig
# None method not supported for zig
# None method not supported for zig
# None method not supported for zig
