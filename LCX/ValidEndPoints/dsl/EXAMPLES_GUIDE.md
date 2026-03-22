# LCX DSL Examples Guide

Complete reference for all 12 DSL example files with descriptions, features, and use cases.

---

## Original Examples (6)

### 1. market_data.lcx
**Purpose:** Basic market data retrieval
**Features:**
- Simple GET operations
- Multiple endpoints (tickers, pairs, book, trades)
- Basic data fetching without complex logic

**Use Case:** Get current market prices and data

**Compile:**
```bash
lcx-cli compile examples/market_data.lcx --lang python
```

---

### 2. authenticated_trading.lcx
**Purpose:** API calls with HMAC authentication
**Features:**
- Authentication handling
- Private API access
- Signature generation

**Use Case:** Authenticated operations requiring API key

---

### 3. trading_operations.lcx
**Purpose:** Core trading operations
**Features:**
- Order placement (BUY, SELL)
- Multiple operations
- Portfolio management

**Use Case:** Execute trades and manage positions

---

### 4. market_data_dynamic.lcx
**Purpose:** Dynamic data queries with parameters
**Features:**
- Parameterized endpoints
- Dynamic queries
- Data filtering

**Use Case:** Query specific market data by parameters

---

### 5. place_order.lcx
**Purpose:** Order execution flow
**Features:**
- Order placement
- Order confirmation
- Basic workflow

**Use Case:** Execute single or batch orders

---

### 6. websocket_streams.lcx
**Purpose:** Real-time data streaming
**Features:**
- Stream-based data
- Real-time updates
- Event handling

**Use Case:** Monitor live market data

---

## New Advanced Examples (6)

### 7. portfolio_analysis.lcx ⭐ NEW
**Purpose:** Multi-pair portfolio analysis
**Features:**
- ✅ **Loops** — Iterate through multiple pairs
- ✅ **Conditionals** — Analyze metrics conditionally
- ✅ **Try/Catch** — Error handling for calculations
- ✅ **Multiple operations** — Coordinated analysis

**Key Operations:**
- `AnalyzePortfolio()` — Fetch all pairs
- `GetPairMetrics(pair)` — Get single pair data
- `CalculatePortfolioValue()` — Sum and analyze portfolio
- `MonitorRiskLevels()` — Conditional risk assessment
- `RebalancePortfolio()` — Rebalance with error handling

**Use Case:** Analyze and manage multi-asset portfolios

**Compile:**
```bash
lcx-cli compile examples/portfolio_analysis.lcx --lang python
lcx-cli compile examples/portfolio_analysis.lcx --lang javascript
lcx-cli compile examples/portfolio_analysis.lcx --lang rust
```

---

### 8. market_surveillance.lcx ⭐ NEW
**Purpose:** Real-time market monitoring with alerts
**Features:**
- ✅ **Nested conditionals** — Multi-level decision logic
- ✅ **Nested loops** — Analyze multiple pairs
- ✅ **Alert system** — Trigger notifications
- ✅ **Correlation analysis** — Detect patterns

**Key Operations:**
- `MonitorAllMarkets()` — Watch all tickers
- `CheckPriceAlert()` — Monitor price thresholds
- `DetectArbitrage()` — Find arbitrage opportunities
- `TrackVolumeSpikes()` — Identify volume anomalies
- `CorrelationAnalysis()` — Find correlated pairs

**Use Case:** Automated market surveillance system

---

### 9. grid_trading.lcx ⭐ NEW
**Purpose:** Automated grid trading strategy
**Features:**
- ✅ **Loop-based order placement** — Place multiple orders
- ✅ **Order tracking** — Monitor filled orders
- ✅ **Conditional execution** — Buy/sell based on level
- ✅ **Grid optimization** — Backtest parameters

**Key Operations:**
- `SetupGrid()` — Initialize grid parameters
- `PlaceGridOrders()` — Place all grid orders
- `MonitorGridPerformance()` — Track filled orders
- `CloseGridPosition()` — Exit grid cleanly
- `OptimizeGridParameters()` — Backtest and optimize

**Use Case:** Passive income strategy with grid trading

**Features Demonstrated:**
```
loop level in 1..grid_levels:
  if level % 2 == 0:
    - place_buy_order(level, order_size)
  else:
    - place_sell_order(level, order_size)
```

---

### 10. risk_management.lcx ⭐ NEW
**Purpose:** Position sizing and risk controls
**Features:**
- ✅ **Stop-loss automation** — Automatic exit on loss
- ✅ **Trailing stops** — Dynamic stop adjustments
- ✅ **Risk calculation** — Account-based sizing
- ✅ **Error handling** — Robust execution

**Key Operations:**
- `CalculatePositionSize()` — Kelly criterion sizing
- `MonitorStopLoss()` — Track and execute stops
- `ImplementTrailingStop()` — Dynamic trailing stops
- `DiversifyPositions()` — Correlation-based allocation
- `AuditRiskMetrics()` — Compliance and limits

**Use Case:** Professional risk management system

**Features Demonstrated:**
```
if loss_percent < -stop_loss_threshold:
  - try:
    - close_position(position.id)
  - catch:
    - send_alert("Failed to close position")
```

---

### 11. dollar_cost_averaging.lcx ⭐ NEW
**Purpose:** Automated regular investment plan
**Features:**
- ✅ **Scheduled execution** — Time-based orders
- ✅ **Dynamic adjustment** — Volatility-based sizing
- ✅ **Performance tracking** — ROI calculations
- ✅ **Pause/Resume logic** — Intelligent control

**Key Operations:**
- `ExecuteDCASchedule()` — Execute scheduled buys
- `AnalyzeDCAPerformance()` — Calculate returns
- `AdjustDCAAmount()` — Volatility-based adjustment
- `PauseAndResumeLogic()` — Conditional pausing
- `GenerateDCAReport()` — Summary reporting

**Use Case:** Long-term wealth building with DCA

---

### 12. technical_analysis.lcx ⭐ NEW
**Purpose:** Technical indicator calculation and signals
**Features:**
- ✅ **Complex calculations** — MA, RSI, Bollinger Bands
- ✅ **Signal generation** — Multi-indicator confirmation
- ✅ **Backtesting** — Historical strategy testing
- ✅ **Loop-based analysis** — Iterative calculations

**Key Operations:**
- `FetchCandleData()` — Get OHLC data
- `CalculateMovingAverages()` — MA20, MA200
- `CalculateRSI()` — Momentum indicator
- `IdentifyTrendWithBollingerBands()` — Volatility bands
- `GenerateTradeSignals()` — Multi-indicator signals
- `BacktestStrategy()` — Historical testing

**Use Case:** Algorithmic trading signal generation

**Features Demonstrated:**
```
loop i in 1..period:
  - if i <= 20:
    - ma_short_sum = ma_short_sum + candles[i].close
  - if i <= 200:
    - ma_long_sum = ma_long_sum + candles[i].close
```

---

## Feature Coverage Matrix

| Feature | Count | Examples |
|---------|-------|----------|
| **Loops** | 6 | portfolio, surveillance, grid, risk, dca, technical |
| **Conditionals** | 6 | portfolio, surveillance, grid, risk, dca, technical |
| **Try/Catch** | 3 | portfolio, risk, technical |
| **Error Handling** | 3 | portfolio, risk, technical |
| **Authentication** | 4 | authenticated, trading, grid, risk |
| **Multiple Endpoints** | 12 | All examples |
| **Complex Workflows** | 6 | New examples |

---

## Quick Compilation Reference

### Compile All Examples to Python
```bash
for file in examples/*.lcx; do
  lcx-cli compile "$file" --lang python
done
```

### Compile to Multiple Languages
```bash
lcx-cli compile examples/portfolio_analysis.lcx --lang python
lcx-cli compile examples/portfolio_analysis.lcx --lang javascript
lcx-cli compile examples/portfolio_analysis.lcx --lang rust
lcx-cli compile examples/portfolio_analysis.lcx --lang go
```

### Run Generated Code
```bash
lcx-cli compile examples/technical_analysis.lcx --lang python -o analysis.py
python3 analysis.py
```

---

## Use Cases by Example

| Use Case | Example | Key Features |
|----------|---------|--------------|
| Market Monitoring | market_surveillance | Loops, conditionals, alerts |
| Position Sizing | risk_management | Calculations, error handling |
| Passive Income | grid_trading | Loops, order management |
| Long-term Investing | dollar_cost_averaging | Scheduling, adjustment |
| Algorithmic Trading | technical_analysis | Indicators, signals |
| Portfolio Management | portfolio_analysis | Multi-asset analysis |

---

## Learning Path

### Beginner
1. `market_data.lcx` — Basic operations
2. `trading_operations.lcx` — Simple workflows
3. `authenticated_trading.lcx` — Authentication

### Intermediate
4. `market_data_dynamic.lcx` — Parameterized queries
5. `portfolio_analysis.lcx` — Loops and conditionals
6. `market_surveillance.lcx` — Nested logic

### Advanced
7. `risk_management.lcx` — Complex error handling
8. `grid_trading.lcx` — Advanced workflows
9. `dollar_cost_averaging.lcx` — Scheduling logic
10. `technical_analysis.lcx` — Complex calculations

---

## Stats

- **Total Examples:** 12
- **Original Examples:** 6
- **New Advanced Examples:** 6
- **Total Lines of Code:** ~2000 lines
- **Languages Supported:** 77
- **Features Demonstrated:** 20+

---

## Next Steps

- 📝 Create domain-specific examples (forex, commodities, stocks)
- 🔄 Add more loop variations and complex workflows
- 🧪 Create example test suites
- 📊 Add performance benchmarking examples
