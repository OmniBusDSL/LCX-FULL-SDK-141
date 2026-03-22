const std = @import("std");


# POST method not supported for zig
# POST method not supported for zig
# POST method not supported for zig
# PUT method not supported for zig
# PUT method not supported for zig
# PUT method not supported for zig
# DELETE method not supported for zig
# DELETE method not supported for zig
pub fn get_all_open_orders(allocator: std.mem.Allocator) !void {
    // GET /api/open
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/open";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_open_orders_for_pair(allocator: std.mem.Allocator) !void {
    // GET /api/open
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/open";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_open_orders_with_date_range(allocator: std.mem.Allocator) !void {
    // GET /api/open
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/open";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_single_order_status(allocator: std.mem.Allocator) !void {
    // GET /api/order
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/order";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_complete_order_history(allocator: std.mem.Allocator) !void {
    // GET /api/orderHistory
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/orderHistory";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_order_history_for_pair(allocator: std.mem.Allocator) !void {
    // GET /api/orderHistory
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/orderHistory";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_order_history_by_status(allocator: std.mem.Allocator) !void {
    // GET /api/orderHistory
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/orderHistory";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_order_history_by_type(allocator: std.mem.Allocator) !void {
    // GET /api/orderHistory
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/orderHistory";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_filtered_order_history(allocator: std.mem.Allocator) !void {
    // GET /api/orderHistory
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/orderHistory";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_all_trade_history(allocator: std.mem.Allocator) !void {
    // GET /api/uHistory
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/uHistory";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_trade_history_for_pair(allocator: std.mem.Allocator) !void {
    // GET /api/uHistory
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/uHistory";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_trade_history_by_date_range(allocator: std.mem.Allocator) !void {
    // GET /api/uHistory
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/uHistory";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn simple_buy_workflow(allocator: std.mem.Allocator) !void {
    // GET /api/order
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/order";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for zig
# PUT method not supported for zig
pub fn get_history(allocator: std.mem.Allocator) !void {
    // GET /api/orderHistory
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/orderHistory";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_trades(allocator: std.mem.Allocator) !void {
    // GET /api/uHistory
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/uHistory";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

# None method not supported for zig
# DELETE method not supported for zig
pub fn confirm_cancelled(allocator: std.mem.Allocator) !void {
    // GET /api/order
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/order";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

# None method not supported for zig
