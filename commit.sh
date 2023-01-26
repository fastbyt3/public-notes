git add .
git commit -m "$(date +%s)"
git push
echo "[!] Done...."

cp -r ~/Documents/work-notes/* ~/Documents/notes/Programming/
cd ~/Documents/notes
git add .
git commit -m "$(date +%s)"
git push
echo "[!] Done"
