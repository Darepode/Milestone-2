    .text
    .globl _start
_start:

    addi x0, x0, 0

    li x5,  0x7010
    li x6,  0xFFFFFFFF
    sw x6,  0(x5)

    li  x4,  0x7000               # Address of Red LED
    li  x8,  15
    sb  x8,  0(x4)                # Hiện 1 LED

# x4  x5  x6  x7  x8  x9  x11  x12
    li x5,  0x7810                # Địa chỉ của I/O memory để đọc nút nhấn
    li x6,  100                   # Số lần cần đọc liên tiếp để debounce (ngưỡng debounce)
    li x7,  8                     # Mask để lấy bit 0-3 (cho 4 nút nhấn)
    li x11, 15                    # Khởi tạo button_state trong thanh ghi x11
    li x12, 0                     # Khởi tạo debounce_count trong thanh ghi x12
poll_buttons:
    lb  x8, 0(x5)                 # Đọc giá trị 8-bit từ địa chỉ 0x7810
    and x8, x8, x7                # Chỉ quan tâm đến 4 bit thấp (bit 0 - button0, bit 1 - button1, ...)
 
    # So sánh với trạng thái trước đó trong thanh ghi x11
    beq x8, x11, debounce         # Nếu giống trạng thái trước đó, kiểm tra debounce
    
    # Nếu khác, reset debounce và lưu trạng thái mới vào thanh ghi x11
    li x12, 0                     # Reset debounce_count trong x12
    mv x11, x8                    # Cập nhật trạng thái nút nhấn mới trong x11
    j poll_buttons                # Quay lại đọc tiếp

debounce:
    addi x12, x12, 1              # Tăng giá trị biến đếm debounce trong x12
    # Nếu debounce count >= x6 thì nút đã ổn định
    bge  x12, x6, cont  # Nếu debounce count đủ lớn, nút đã ổn định
    j poll_buttons                # Nếu chưa đủ, tiếp tục kiểm tra

#---------------------------Release debounce-----------------------------------
cont:
    #li  x4, 15                    # Giá trị khi các button được nhả = 1111
    li   x12, 0                   # Reset debounce_count
released_check:
    lb  x8, 0(x5)                 # Đọc lại trạng thái button
    and x8, x8, x7

    ori x11, x11, 8              
    beq x8, x4, r_debounce        # Nếu button được nhả ra
    j released_check              # Quay lại nếu chưa được nhả

r_debounce:
    addi x12, x12, 1              # Tăng giá trị biến đếm debounce trong x12
    bge  x12, x6, task            # Nếu debounce count đủ lớn, nút đã ổn định
    j released_check
#-------------------------------------------------------------------------------
task:
    li  x11, 15                   # Reset button_state
    li  x12, 0                    # Reset debounce_count
    li  x4,  0x7000               # Address of Red LED

    lb  x8,  0(x4)                # Hiện 1 LED
    li  x10,  0x0000FFFF
    xor x8, x8, x10
    sb  x8, 0(x4)
    j   poll_buttons              # Quay lại tiếp tục đọc nút nhấn

