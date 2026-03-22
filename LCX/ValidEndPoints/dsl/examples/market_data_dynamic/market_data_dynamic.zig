const std = @import("std");


pub fn fetch_all_pairs_data(allocator: std.mem.Allocator) !void {
    // GET /api/ticker
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/ticker";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);

    std.debug.print("{{}}\n", .{{body}});

}

# Workflow: FetchAllPairsData (sequence)

pub fn get_ethusdc_ticker(allocator: std.mem.Allocator) !void {
    // GET /api/ticker
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/ticker";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);

    std.debug.print("{{}}\n", .{{body}});

}

pub fn get_lcxusdc_ticker(allocator: std.mem.Allocator) !void {
    // GET /api/ticker
    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const url = "https://exchange-api.lcx.com/api/ticker";
    var req = try client.open(.GET, try std.Uri.parse(url), .{}, .{});
    defer req.deinit();

    try req.send();
    var body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);

    std.debug.print("{{}}\n", .{{body}});

}

