# Union Shop - Test Runner Script
# This script repairs Flutter cache, installs dependencies, and runs all tests

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Union Shop - Running Test Suite" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Repair Flutter pub cache
Write-Host "Step 1/3: Repairing Flutter pub cache..." -ForegroundColor Yellow
flutter pub cache repair
if ($LASTEXITCODE -ne 0) {
    Write-Host "Warning: Cache repair had issues, continuing anyway..." -ForegroundColor Yellow
}
Write-Host "✓ Cache repair complete" -ForegroundColor Green
Write-Host ""

# Step 2: Get dependencies
Write-Host "Step 2/3: Installing dependencies..." -ForegroundColor Yellow
flutter pub get
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ Failed to get dependencies" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Dependencies installed" -ForegroundColor Green
Write-Host ""

# Step 3: Run tests
Write-Host "Step 3/3: Running all tests..." -ForegroundColor Yellow
Write-Host ""
flutter test --reporter expanded
$testResult = $LASTEXITCODE

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
if ($testResult -eq 0) {
    Write-Host "✓ ALL TESTS PASSED!" -ForegroundColor Green
} else {
    Write-Host "✗ Some tests failed" -ForegroundColor Red
}
Write-Host "========================================" -ForegroundColor Cyan

exit $testResult
