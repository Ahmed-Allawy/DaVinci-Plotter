function sendAngles(S,arr)
    fprintf(S, sprintf("{""servo1"":""%.2f"",""servo2"":""%.2f"",""servo3"":""%.2f"",""servo4"":""%.2f""}",arr(1),arr(2),arr(3),arr(4)));
end
