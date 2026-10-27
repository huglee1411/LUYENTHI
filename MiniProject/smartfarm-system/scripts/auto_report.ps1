# Tao tieu de bao cao vao file backup/bao-cao-su-co.txt
Write-Output "BAO CAO SU CO HE THONG SMARTFARM" | Out-File -Encoding utf8 "..\backup\bao-cao-su-co.txt"
Write-Output "Thoi gian tao: $(Get-Date)" | Out-File -Encoding utf8 -Append "..\backup\bao-cao-su-co.txt"
Write-Output "--------------------------------------------------" | Out-File -Encoding utf8 -Append "..\backup\bao-cao-su-co.txt"

# Loc cac dong CRITICAL hoac ERROR tu log-he-thong.log va chen noi vao bao cao
Get-Content "..\data\log-he-thong.log" | Select-String "CRITICAL", "ERROR" | Out-File -Encoding utf8 -Append "..\backup\bao-cao-su-co.txt"

# Dem tong so dong loi va ghi vao cuoi bao cao
$soSuCo = (Get-Content "..\data\log-he-thong.log" | Select-String "CRITICAL", "ERROR").Count
Write-Output "--------------------------------------------------" | Out-File -Encoding utf8 -Append "..\backup\bao-cao-su-co.txt"
Write-Output "TONG SO SU CO: $soSuCo" | Out-File -Encoding utf8 -Append "..\backup\bao-cao-su-co.txt"