# Bloco do Plano de Fundo 
# Defina a URL do blob e o caminho de destino - Wallpaper
$blobUrl1 = "https://raw.githubusercontent.com/wpp-proativa/Intune-wpp/refs/heads/main/Wallpaper.jpg"
$destinationPath1 = "C:\Wallpaper\Wallpaper.jpg"

# Baixe a IMAGEM DO WALLPAPER do blob e salve no caminho de destino
Invoke-WebRequest -Uri $blobUrl1 -OutFile $destinationPath1

# Bloco da Tela de bloqueio - CASO NÃO PRECISE COMENTE AS LINHAS ABAIXO.
# Defina a URL do blob e o caminho de destino - LockScreen
$blobUrl2 = "https://raw.githubusercontent.com/wpp-proativa/Intune-wpp/refs/heads/main/LockScreen.jpg"
$destinationPath2 = "C:\Wallpaper\LockScreen.jpg"

# Baixe a IMAGEM DO LOOK SCREEN do blob e salve no caminho de destino
Invoke-WebRequest -Uri $blobUrl2 -OutFile $destinationPath2

#PARTE 2 -ATUALIZA O PLANO DE FUNDO
# Caminho da imagem para o novo plano de fundo
$wallpaperPath = "C:\Wallpaper\Wallpaper.jpg"

# Definir o plano de fundo usando a API do Windows
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# Constantes para definir o plano de fundo
$SPI_SETDESKWALLPAPER = 0x0014
$SPIF_UPDATEINIFILE = 0x01
$SPIF_SENDCHANGE = 0x02

# Aplicar o novo plano de fundo
[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $wallpaperPath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
