const std = @import("std");


pub fn fetch_all_tickers(allocator: std.mem.Allocator) !void {
    // GET /api/tickers
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/tickers";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);

    std.debug.print("{{}}\n", .{{body}});

}

pub fn get_ticker_for_pair(allocator: std.mem.Allocator) !void {
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

pub fn fetch_all_pairs(allocator: std.mem.Allocator) !void {
    // GET /api/pairs
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/pairs";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);

    std.debug.print("{{}}\n", .{{body}});

}

pub fn get_pair_info(allocator: std.mem.Allocator) !void {
    // GET /api/pair/BTC/USDC
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/pair/BTC/USDC";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_order_book(allocator: std.mem.Allocator) !void {
    // GET /api/book
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/book";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);

    std.debug.print("{{}}\n", .{{body}});

}

pub fn get_recent_trades(allocator: std.mem.Allocator) !void {
    // GET /api/trades
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/trades";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

pub fn get_candle_data(allocator: std.mem.Allocator) !void {
    // GET /v1/market/kline
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://api-kline.lcx.com/v1/market/kline";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);

    std.debug.print("{{}}\n", .{{body}});

}

pub fn market_overview(allocator: std.mem.Allocator) !void {
    // GET /api/book
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/book";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

# Workflow: MarketOverview (sequence)

pub fn get_trades(allocator: std.mem.Allocator) !void {
    // GET /api/trades
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/trades";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);


}

# None method not supported for zig
