echo "BUILDING STARTS AT $APP_PATH"
git clone https://github.com/arpinum/transporter.git $APP_PATH
cd $APP_PATH
echo  "INSTALLING GODEP"
go get github.com/tools/godep
echo  "RESTORING deps"
godep restore
echo "INSTALLING transporter"
godep go install -a -v ./cmd/...
