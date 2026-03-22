# LCX Exchange - Modify Endpoint Price Constraints

## Summary Table

| Order Type | Min Price | Max Price | Spread | Range Width |
|------------|-----------|-----------|--------|-------------|
| **BUY** | 0.0225 | ∞ (no upper limit) | N/A | Unlimited ↑ |
| **SELL** | (no lower limit) | 0.0657 | 0.0657 - 0.0225 | Unlimited ↓ |
| **Valid Modify Range** | **0.0225** | **0.0657** | **0.0432** | **4.32% spread** |

## Constraints Explanation

### BUY Orders
- **Minimum modify price:** 0.0225 USDC
- **Maximum modify price:** No upper limit (unlimited)
- **Constraint:** Price ≥ 0.0225

### SELL Orders
- **Minimum modify price:** No lower limit (unlimited)
- **Maximum modify price:** 0.0657 USDC
- **Constraint:** Price ≤ 0.0657

### Intersection (Both types)
- **Usable range for both:** 0.0225 to 0.0657 USDC
- **Spread:** 0.0432 USDC (4.32% of min price)

## Safe Pricing Examples

| Scenario | Price | Valid? | Reason |
|----------|-------|--------|--------|
| BUY order modify | 0.0225 | ✅ | At minimum (exactly valid) |
| BUY order modify | 0.045 | ✅ | Mid-range, safe |
| BUY order modify | 0.0657 | ✅ | At maximum, still valid |
| SELL order modify | 0.0225 | ✅ | Well below maximum |
| SELL order modify | 0.045 | ✅ | Mid-range, safe |
| SELL order modify | 0.0657 | ✅ | At maximum (exactly valid) |
| Any order modify | 0.02 | ❌ | Below minimum (0.0225) |
| Any order modify | 0.07 | ❌ | Above maximum (0.0657) |

## Spread Calculation

```
Spread = Max Price - Min Price
Spread = 0.0657 - 0.0225
Spread = 0.0432 USDC

Percentage of Min Price = (0.0432 / 0.0225) × 100
Percentage of Min Price = 1.92 × 100
Percentage of Min Price = 192% (spread is ~2x the minimum)
```

## Perfect Midpoint Analysis

**The price 0.045 USDC is the EXACT MIDPOINT between min and max:**

### Symmetrical Distribution
```
BUY MINIMUM ←────── 0.045 (CENTER) ──────→ SELL MAXIMUM
   0.0225              ↓                      0.0657
                   MIDPOINT
```

### Percentage Movement from Center
| Direction | From Center | To Limit | Change |
|-----------|------------|----------|--------|
| **DOWN** (Buy) | 0.045 | 0.0225 | -50.00% |
| **UP** (Sell) | 0.045 | 0.0657 | +50.00% |

**Observation:** Price of 0.045 is perfectly balanced:
- Need 50% price decrease to hit minimum (0.0225)
- Need 50% price increase to hit maximum (0.0657)

## Recommended Safe Zone

For reliable testing without errors:
- **Modify to prices between 0.03 and 0.06 USDC**
- Keeps comfortable margin from both limits
- Center point: **0.045 USDC** (perfect symmetry)
- Safe range: ±0.015 USDC from center

## Test Results

Current test: `test_modify_open_order.py`
- Create: BUY 50 LCX @ 0.03 USDC ✅
- Modify: Amount 100 LCX @ 0.045 USDC ✅ (within valid range)
