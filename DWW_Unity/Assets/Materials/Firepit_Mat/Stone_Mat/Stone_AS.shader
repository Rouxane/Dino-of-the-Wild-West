// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_Stone_Base_Color("Stone_Base_Color", 2D) = "white" {}
		_Stone_Mixed_AO("Stone_Mixed_AO", 2D) = "white" {}
		_Stone_Normal_DirectX("Stone_Normal_DirectX", 2D) = "bump" {}
		_Stone_Roughness("Stone_Roughness", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Stone_Normal_DirectX;
		uniform float4 _Stone_Normal_DirectX_ST;
		uniform sampler2D _Stone_Base_Color;
		uniform float4 _Stone_Base_Color_ST;
		uniform sampler2D _Stone_Roughness;
		uniform float4 _Stone_Roughness_ST;
		uniform sampler2D _Stone_Mixed_AO;
		uniform float4 _Stone_Mixed_AO_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Stone_Normal_DirectX = i.uv_texcoord * _Stone_Normal_DirectX_ST.xy + _Stone_Normal_DirectX_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Stone_Normal_DirectX, uv_Stone_Normal_DirectX ) );
			float2 uv_Stone_Base_Color = i.uv_texcoord * _Stone_Base_Color_ST.xy + _Stone_Base_Color_ST.zw;
			o.Albedo = tex2D( _Stone_Base_Color, uv_Stone_Base_Color ).rgb;
			float2 uv_Stone_Roughness = i.uv_texcoord * _Stone_Roughness_ST.xy + _Stone_Roughness_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _Stone_Roughness, uv_Stone_Roughness ) ).r;
			float2 uv_Stone_Mixed_AO = i.uv_texcoord * _Stone_Mixed_AO_ST.xy + _Stone_Mixed_AO_ST.zw;
			o.Occlusion = tex2D( _Stone_Mixed_AO, uv_Stone_Mixed_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
-2;10;1906;1010;1085.573;335.2492;1;True;False
Node;AmplifyShaderEditor.SamplerNode;4;-625.5728,268.7508;Float;True;Property;_Stone_Roughness;Stone_Roughness;3;0;Create;True;0;0;False;0;9c25aeae91eeca34d8d5e24cfb95abbd;9c25aeae91eeca34d8d5e24cfb95abbd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;5;-223.5728,193.7508;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;3;-579.5728,-9.249207;Float;True;Property;_Stone_Normal_DirectX;Stone_Normal_DirectX;2;0;Create;True;0;0;False;0;453b9e27c7f818b42b2f0c2d3037c803;453b9e27c7f818b42b2f0c2d3037c803;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-565.5728,-257.2492;Float;True;Property;_Stone_Base_Color;Stone_Base_Color;0;0;Create;True;0;0;False;0;8e7d0501b34d1af4a8e3ece1d8dfc88c;8e7d0501b34d1af4a8e3ece1d8dfc88c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-234.5728,401.7508;Float;True;Property;_Stone_Mixed_AO;Stone_Mixed_AO;1;0;Create;True;0;0;False;0;65dca0a681516954b9a0b7c8ef0e9b37;65dca0a681516954b9a0b7c8ef0e9b37;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;198,20;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;4;0
WireConnection;0;0;1;0
WireConnection;0;1;3;0
WireConnection;0;4;5;0
WireConnection;0;5;2;0
ASEEND*/
//CHKSM=7970C3773653947E49FB219D8C27868F3CEAF8F2