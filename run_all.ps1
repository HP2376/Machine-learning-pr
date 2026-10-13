$experiments = 1..12

foreach ($n in $experiments) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "  Practical $n  -  exp_$n.py" -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""

    if ($n -eq 12) {
        uv run --python 3.13 --with numpy --with pandas --with scikit-learn --with tensorflow "exp_$n.py" 2>&1 | Where-Object { $_ -notmatch "^(WARNING|I0000|Downloading|Downloaded|Installed)" }
    } else {
        uv run --with numpy --with scikit-learn --with scipy --with matplotlib "exp_$n.py" 2>&1
    }

    Write-Host ""
    Write-Host "----------------------------------------" -ForegroundColor DarkGray
    if ($n -lt 12) {
        Write-Host "  Press ENTER to run next practical..." -ForegroundColor Green
        Read-Host
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  All 12 Practicals Completed!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
