#version 450 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNorm;
layout (location = 2) in vec2 aUv;

layout (location = 0) out vec3 pos;
layout (location = 1) out vec3 norm;
layout (location = 2) out vec2 uv;

layout (push_constant) uniform PushConstants
{
	mat4 model;
	mat4 view;
	mat4 projection;
};

void main()
{
	pos  = vec3(model * vec4(aPos, 1.0));
	norm = mat3(transpose(inverse(model))) * aNorm;
	uv   = aUv;

	gl_Position = projection * view * model * vec4(aPos, 1.0f);
}
