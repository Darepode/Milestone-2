    .text
    .globl _start
_start:
    li x5, 0x7810                 # Địa chỉ của I/O memory để đọc nút nhấn
    li x6, 50                     # Số lần cần đọc liên tiếp để debounce (ngưỡng debounce)
    li x7, 15                     # Mask để lấy bit 0-3 (cho 4 nút nhấn)
    li x11, 0                     # Khởi tạo button_state trong thanh ghi x11
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
    bge  x12, x6, butt_recog      # Nếu debounce count đủ lớn, nút đã ổn định
    
    j poll_buttons                # Nếu chưa đủ, tiếp tục kiểm tra

butt_recog:
    # Kiểm tra từng nút
    li   x12, 0                   # Reset debounce_count
    li   x9, 1                    # Keycode
    bne  x8, x9, butt1            # Nếu button0 được nhấn
    j   released_check

butt1:  
    li   x9, 2
    bne  x9, x8, butt2            # Nếu button1 được nhấn
    j   released_check
    
butt2:
    
    li   x9, 3
    bne  x9, x8, butt3            # Nếu button2 được nhấn
    j   released_check
    
butt3:
    li   x9, 4
    beq  x9, x8, released_check   # Nếu button3 được nhấn
    j poll_buttons                # Quay lại tiếp tục đọc nút nhấn
#---------------------------Release debounce-----------------------------------
released_check:
    lb  x8, 0(x5)
    and x8, x8, x7

    beq x8, x0, r_debounce
    j released_check

r_debounce:
    addi x12, x12, 1              # Tăng giá trị biến đếm debounce trong x12
    bge  x12, x6, task            # Nếu debounce count đủ lớn, nút đã ổn định
    j released_check
#-------------------------------------------------------------------------------
task:
    li  x11, 0                    # Reset button_state
    li  x12, 0                    # Reset debounce_count
    li  x4,  0x7000
    # Xử lý khi button 0 được nhấn
    li  x8,  1
    bne x9,  x8, button1_pressed
    sb  x8,  0(x4)
    j   poll_buttons              # Quay lại tiếp tục đọc nút nhấn

button1_pressed:
    # Xử lý khi button 1 được nhấn
    li  x8,  2
    bne x9,  x8, button2_pressed
    sb  x8,  0(x4)
    j   poll_buttons              # Quay lại tiếp tục đọc nút nhấn

button2_pressed:
    # Xử lý khi button 2 được nhấn
    li  x8,  3
    bne x9,  x8, button3_pressed
    sb  x8,  0(x4)
    j   poll_buttons              # Quay lại tiếp tục đọc nút nhấn

button3_pressed:
    # Xử lý khi button 3 được nhấn
    li  x8,  4
    bne x9,  x8, poll_buttons
    sb  x8,  0(x4)
    j   poll_buttons              # Quay lại tiếp tục đọc nút nhấn
