const std = @import("std");


pub fn get_account_info(allocator: std.mem.Allocator) !void {
    // GET /api/account
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/account";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_balances(allocator: std.mem.Allocator) !void {
    // GET /api/balances
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/balances";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_asset_balance(allocator: std.mem.Allocator) !void {
    // GET /api/balance
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/balance";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_trading_fees(allocator: std.mem.Allocator) !void {
    // GET /api/fees
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/fees";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_open_orders(allocator: std.mem.Allocator) !void {
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

pub fn get_order_details(allocator: std.mem.Allocator) !void {
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

pub fn get_order_history(allocator: std.mem.Allocator) !void {
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

pub fn get_user_trade_history(allocator: std.mem.Allocator) !void {
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

# POST method not supported for zig
# PUT method not supported for zig
# DELETE method not supported for zig
# DELETE method not supported for zig
pub fn check_balance_workflow(allocator: std.mem.Allocator) !void {
    // GET /api/balances
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/balances";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for zig
pub fn place_order_workflow(allocator: std.mem.Allocator) !void {
    // GET /api/ticker
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/ticker";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for zig
pub fn get_order_info(allocator: std.mem.Allocator) !void {
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
pub fn manage_open_orders_workflow(allocator: std.mem.Allocator) !void {
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

# Workflow: ManageOpenOrdersWorkflow (sequence)

pub fn get_trade_history(allocator: std.mem.Allocator) !void {
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
# PUT method not supported for zig
# DELETE method not supported for zig
# None method not supported for zig
pub fn account_monitoring_workflow(allocator: std.mem.Allocator) !void {
    // GET /api/balances
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/balances";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

# Workflow: AccountMonitoringWorkflow (sequence)

pub fn get_open_orders(allocator: std.mem.Allocator) !void {
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

pub fn get_fees(allocator: std.mem.Allocator) !void {
    // GET /api/fees
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/fees";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

# None method not supported for zig
