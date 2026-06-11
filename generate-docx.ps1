# Kempe Obstruction Theory - 文档生成脚本
# 功能：合并 markdown 源文件并转换为 docx，自动处理图片

$workDir = $PSScriptRoot
$tempDir = Join-Path $env:TEMP "kempe-paper-temp"
$paperDir = Join-Path $workDir "paper"
$figuresDir = Join-Path $paperDir "figures"

# 创建临时目录
if (-not (Test-Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir | Out-Null
}

# 源文件列表
$sourceFiles = @(
    "paper\zh\00-frontmatter.md",
    "paper\zh\01-concepts.md",
    "paper\zh\02-theorem1.md",
    "paper\zh\03-theorem2.md",
    "paper\zh\04-main-proof.md",
    "paper\zh\05-comparison.md"
)

Write-Output "📄 合并 markdown 源文件..."

# 读取所有源文件并合并
$content = @()
foreach ($file in $sourceFiles) {
    $fullPath = Join-Path $workDir $file
    if (Test-Path $fullPath) {
        $content += Get-Content $fullPath -Encoding UTF8
        $content += "`n`n"
    } else {
        Write-Warning "文件未找到: $file"
    }
}

# 将合并内容写入临时文件
$tempMd = Join-Path $tempDir "complete-paper.md"
$content | Set-Content $tempMd -Encoding UTF8

Write-Output "🖼️  处理图片引用..."

# 修改图片路径为绝对路径
$mdContent = Get-Content $tempMd -Encoding UTF8 -Raw
$mdContent = $mdContent -replace '\.\.\/figures\/', "$figuresDir\"
$mdContent = $mdContent -replace 'src="([^"]+)"', 'src="$1"'
$mdContent | Set-Content $tempMd -Encoding UTF8

Write-Output "📝 转换为 docx..."

# 转换为 docx
$outputDocx = Join-Path $workDir "Kempe-Obstruction-Theory.docx"

# 使用 pandoc 转换（尝试嵌入图片）
$pandocArgs = @(
    $tempMd,
    "-o", $outputDocx,
    "--toc",
    "--toc-depth=3",
    "--resource-path=$paperDir;$figuresDir"
)

& pandoc @pandocArgs 2>&1 | Out-Null

if ($LASTEXITCODE -eq 0) {
    Write-Output "✅ 文档生成成功: Kempe-Obstruction-Theory.docx"
    Write-Output "📊 文件大小: $((Get-Item $outputDocx).Length / 1KB) KB"
} else {
    Write-Error "❌ pandoc 转换失败"
}

# 清理临时目录
Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
Write-Output "🧹 已清理临时文件"
