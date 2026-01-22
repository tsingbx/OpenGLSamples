#version 330 core

layout (location = 0) in vec3 aPos; //顶点位置
layout (location = 1) in vec3 aNormal; //法线
out vec3 FragPos; //片段位置
out vec3 Normal; //将法线传递到片段着色器

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
	gl_Position = projection * view * model * vec4(aPos, 1.0);
	FragPos = vec3(model * vec4(aPos, 1.0));
	//计算法线矩阵,避免不等比缩放破坏法线,矩阵求逆效率太低
	//mat3 normalMatrix = mat3(transpose(inverse(model))); 
	//Normal = normalMatrix * aNormal;//避免不等比缩放破坏法线
    Normal = vec3(model * vec4(aNormal, 0.0));
}