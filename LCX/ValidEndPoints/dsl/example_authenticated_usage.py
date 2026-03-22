#!/usr/bin/env python3
"""
Example: Using Authenticated LCX API Endpoints

This script demonstrates how to:
1. Load .env file with API credentials
2. Use authenticated DSL-generated code
3. Access private endpoints (balances, orders, etc.)

SETUP:
  1. Create .env file: cp .env.example .env
  2. Add your LCX API credentials to .env
  3. Run: python3 example_authenticated_usage.py
"""

import sys
import os

# Load environment from .env file
try:
    from load_env import load_env, verify_auth

    print("[*] Loading LCX API credentials from .env...")
    env_vars = load_env()
    print(f"[OK] Loaded {len(env_vars)} environment variables")

    print("[*] Verifying authentication...")
    verify_auth()
    print("[OK] API credentials verified!")

except FileNotFoundError as e:
    print(f"[ERROR] {e}")
    print("\nSetup:")
    print("  1. cp dsl/.env.example dsl/.env")
    print("  2. Edit .env and add your LCX API key and secret")
    print("  3. Run: python3 example_authenticated_usage.py")
    sys.exit(1)

except ValueError as e:
    print(f"[ERROR] {e}")
    sys.exit(1)

# Now we can import and use authenticated code
print("\n" + "=" * 70)
print("AUTHENTICATED ENDPOINTS EXAMPLES")
print("=" * 70)

# Example 1: Get Account Info
print("\n[1] Get Account Information")
print("-" * 70)
try:
    # This would use generated code like:
    # from generated_market_data import get_account_info
    # account = get_account_info()

    print("Would call: GET /api/account")
    print("Returns: Account details (user ID, verification status, etc.)")
    print("Example response:")
    print("""
    {
      "userId": "user123",
      "email": "user@example.com",
      "verified": true,
      "created": 1234567890
    }
    """)
except Exception as e:
    print(f"Error: {e}")

# Example 2: Get Balances
print("\n[2] Get All Account Balances")
print("-" * 70)
try:
    # from generated_market_data import get_balances
    # balances = get_balances()

    print("Would call: GET /api/balances")
    print("Returns: All asset balances")
    print("Example response:")
    print("""
    {
      "BTC": 0.5,
      "ETH": 2.0,
      "USDC": 1000.0,
      "LCX": 100.0
    }
    """)
except Exception as e:
    print(f"Error: {e}")

# Example 3: Get Specific Balance
print("\n[3] Get Balance for Specific Asset")
print("-" * 70)
try:
    # from generated_market_data import get_asset_balance
    # btc_balance = get_asset_balance('BTC')

    print("Would call: GET /api/balance?asset=BTC")
    print("Returns: Balance for one asset")
    print("Example response:")
    print("""
    {
      "asset": "BTC",
      "balance": 0.5,
      "available": 0.5,
      "reserved": 0.0
    }
    """)
except Exception as e:
    print(f"Error: {e}")

# Example 4: Get Open Orders
print("\n[4] Get Open Orders")
print("-" * 70)
try:
    # from generated_market_data import get_open_orders
    # orders = get_open_orders('BTC/USDC')

    print("Would call: GET /api/orders/open?pair=BTC/USDC")
    print("Returns: All open orders for a pair")
    print("Example response:")
    print("""
    [
      {
        "orderId": "order123",
        "pair": "BTC/USDC",
        "side": "buy",
        "amount": 0.5,
        "price": 40000,
        "status": "open"
      },
      {
        "orderId": "order124",
        "pair": "BTC/USDC",
        "side": "sell",
        "amount": 1.0,
        "price": 45000,
        "status": "open"
      }
    ]
    """)
except Exception as e:
    print(f"Error: {e}")

# Example 5: Place Order
print("\n[5] Place a Buy Order")
print("-" * 70)
try:
    # from generated_market_data import place_buy_order
    # result = place_buy_order('BTC/USDC', 0.5, 40000)

    print("Would call: POST /api/order")
    print("Params: pair=BTC/USDC, amount=0.5, price=40000")
    print("Returns: Order confirmation")
    print("Example response:")
    print("""
    {
      "orderId": "order125",
      "pair": "BTC/USDC",
      "side": "buy",
      "amount": 0.5,
      "price": 40000,
      "timestamp": 1234567890,
      "status": "open"
    }
    """)
except Exception as e:
    print(f"Error: {e}")

# Example 6: Cancel Order
print("\n[6] Cancel an Order")
print("-" * 70)
try:
    # from generated_market_data import cancel_order
    # result = cancel_order('order125')

    print("Would call: DELETE /api/order?order_id=order125")
    print("Returns: Cancellation confirmation")
    print("Example response:")
    print("""
    {
      "orderId": "order125",
      "status": "cancelled",
      "timestamp": 1234567891
    }
    """)
except Exception as e:
    print(f"Error: {e}")

# Example 7: Trading Workflow
print("\n[7] Complete Trading Workflow")
print("-" * 70)
print("Sequence:")
print("  1. Get current BTC price (public endpoint)")
print("  2. Check BTC balance (requires auth)")
print("  3. Place buy order if balance is available (requires auth)")
print("  4. Get order details (requires auth)")
print("  5. Print summary")

print("\nExample DSL code:")
print("""
TradingWorkflow:
  sequence:
    1. GetPrice:
         endpoint: GET /api/ticker
         auth: none
         input: BTC/USDC
         output: save current_price

    2. CheckBalance:
         endpoint: GET /api/balance
         auth: required
         input: BTC
         output: save btc_balance

    3. PlaceOrder:
         endpoint: POST /api/order
         auth: required
         input: BTC/USDC, 0.5, 40000
         output: save order_id

    4. ConfirmOrder:
         endpoint: GET /api/order
         auth: required
         input: order_id
         output: save order_details

    5. print "Price: " + current_price
       print "Balance: " + btc_balance
       print "Order: " + order_details
""")

print("\n" + "=" * 70)
print("NEXT STEPS")
print("=" * 70)
print("""
1. Create your DSL file with authenticated endpoints:
   cat > dsl/examples/my_trading.lcx << 'EOF'
   GetMyBalance:
     endpoint: GET /api/balance
     auth: required
     input: asset
     output: json
   EOF

2. Compile to Python:
   cd dsl
   python3 compiler/cli.py examples/my_trading.lcx --target python

3. Use in your code:
   from load_env import load_env
   load_env()

   from generated_my_trading import get_my_balance
   btc_balance = get_my_balance('BTC')
   print(f"Your BTC balance: {btc_balance}")

4. Or use with authenticated_trading.lcx:
   python3 compiler/cli.py examples/authenticated_trading.lcx --target python
   # → generates: generated_authenticated_trading.py
""")

print("\n[OK] Authentication setup verified! You're ready to use private endpoints.")
