#!/bin/bash

# Verifica se o yt-dlp está instalado
if ! command -v yt-dlp &> /dev/null; then
    echo "yt-dlp não está instalado. Por favor, instale usando 'pip install -U yt-dlp'"
    exit 1
fi

# Verifica se o ffmepg está instalado.
if ! command -v ffmpeg &> /dev/null; then
	echo "O yt-dlp depende do ffmpeg para converter os videos em áudios. Por favor, instale e rode o script novamente"
	exit 1
fi

# Verifica se o número correto de argumentos foi fornecido
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <url_da_playlist>"
    exit 1
fi

# URL da playlist fornecida como argumento
playlist_url=$1

# Diretório de destino para salvar os arquivos
output_directory="Musicas"

# Cria o diretório de destino se não existir
mkdir -p "$output_directory"

# Executa o yt-dlp para baixar a playlist
yt-dlp -i --extract-audio --audio-format mp3 --audio-quality 0 --output "$output_directory/%(title)s.%(ext)s" "$playlist_url"

echo "Download concluído. Os arquivos foram salvos em '$output_directory'."

