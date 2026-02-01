
#version 330 core

in vec2 TexCoords;

out vec4 FragColor;

uniform sampler2D screenTexture;

void main()
{
    //反相效果
    FragColor = vec4(vec3(1.0 - texture(screenTexture, TexCoords)), 1.0);
}