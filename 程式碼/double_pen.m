function dydt = double_pen(t,y,m,len,g)
dydt = zeros(4,1);
%alias
m_1 = m(1);
m_2 = m(2);
L_1 = len(1);
L_2 = len(2);

%DE
dydt(1) = y(2);
dydt(2) = -(sin(y(1))*(2*g*m_1 + g*m_2) + g*m_2*sin(y(1) - 2*y(3)) + 2*L_2*m_2*sin(y(1) - y(3))*y(4)^2 + L_1*m_2*y(2)^2*sin(2*y(1) - 2*y(3)))/(L_1*(2*m_1 + m_2 + m_2*(2*sin(y(1) - y(3))^2 - 1)));
dydt(3) = y(4);
dydt(4) = (sin(y(1) - y(3))*(2*L_1*m_1*y(2)^2 + 2*L_1*m_2*y(2)^2) - sin(y(3))*(g*m_1 + g*m_2) + g*m_1*sin(2*y(1) - y(3)) + g*m_2*sin(2*y(1) - y(3)) + L_2*m_2*y(4)^2*sin(2*y(1) - 2*y(3)))/(L_2*(2*m_1 + m_2 + m_2*(2*sin(y(1) - y(3))^2 - 1)));


%temporary storage
%a = (m_1+m_2)*L_1 ;
%b = m_2*L_2*cos(y(1)-y(3)) ;
%c = m_2*L_1*cos(y(1)-y(3)) ;
%d = m_2*L_2 ;
%e = -m_2*L_2*y(4)*y(4)*sin(y(1)-y(3))-g*(m_1+m_2)*sin(y(1));
%f = m_2*L_1*y(2)*y(2)*sin(y(1)-y(3))-m_2*g*sin(y(3));

%DE
%dydt(1) = y(2);
%dydt(2) = (e*d-b*f)/(a*d-c*b) ;
%dydt(3) = y(4);
%dydt(4) = (a*f-c*e)/(a*d-c*b) ;
end

