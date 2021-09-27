# CRUD Profile
## MounteBank
- สำหรับการ Mock Api ของ method ต่างๆ เช่น create, get, update, delete (CRUD) <br>

## Robot Framework
ใช้สำหรับทดสอบ MounteBank ที่สร้างขึ้นมาโดยมี case ดังนี้ <br>
> Case 1 : method POST ใช้สำหรับการ create data <br>
โดยต้องมี Response (status_code) : 201<br>
โดยต้องมี Response (success) : <br>
{
        "status":"success"
}

> Case 2 : method GET ใช้สำหรับการ read data  <br>
โดยต้องมี Response (status_code) : 200<br>
โดยต้องมี Response (success) : <br>
{
        "userId": "1",
        "firstname" : "Mr.Boss",
        "lastname" : "Baby"
}

> Case 3 : method PUT ใช้สำหรับการ update data <br>
โดยต้องมี Response (status_code) : 200<br>
โดยต้องมี Response (success) : <br>
{
        "status":"success"
}

> Case 4 : method DELETE ใช้สำหรับการ delete data  <br>
โดยต้องมี Response (status_code) : 200<br>
โดยต้องมี Response (success) : <br>
{
        "status":"success"
}


    