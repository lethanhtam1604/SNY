//Cho 1 mảng số nguyên tăng dần n phần tử
//Hỏi: Tìm 2 số có tổng = 1 số X cho trước

i = 0; j = b.size() - 1;

while (i < a.size()) {
    while(a[i] + b[j] > X && j > 0) j--;
    if (a[i] + b[j] == X) writeAnswer(i, j);
        i++;
}
