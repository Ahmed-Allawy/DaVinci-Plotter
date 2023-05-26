function [curvePoints] = getCurvePoints(Xc, Yc, raduis, startAngle, endAngle,  R)
      d = (endAngle-startAngle)/R;
      curvePoints = zeros(R+1,2);
      for i = 1:R+1
        curvePoints(i,1) = Xc + raduis*cos(startAngle+(i-1)*d);
        curvePoints(i,2) = Yc + raduis*sin(startAngle+(i-1)*d);
      end
end