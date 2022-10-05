http://18.139.160.22/

Cách thức thực hiện:
Sau khi chạy terraform thì ssh vào EC2 thực hiện các câu lệnh sau:

cd /home/ec2-user/uploads3
go mod init uploads3
go get github.com/kataras/iris/v12@master
go mod tidy
go build
./uploads3

Lý do phải ssh do những dòng code đó cho vào user_data nhưng hệ thống ko chạy
