// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_T_MudSoil_R("T_MudSoil_R", 2D) = "white" {}
		_T_MudSoil_AO("T_MudSoil_AO", 2D) = "white" {}
		_T_MudSoil_BC("T_MudSoil_BC", 2D) = "white" {}
		_T_MudSoil_N("T_MudSoil_N", 2D) = "bump" {}
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

		uniform sampler2D _T_MudSoil_N;
		uniform float4 _T_MudSoil_N_ST;
		uniform sampler2D _T_MudSoil_BC;
		uniform float4 _T_MudSoil_BC_ST;
		uniform sampler2D _T_MudSoil_R;
		uniform float4 _T_MudSoil_R_ST;
		uniform sampler2D _T_MudSoil_AO;
		uniform float4 _T_MudSoil_AO_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_T_MudSoil_N = i.uv_texcoord * _T_MudSoil_N_ST.xy + _T_MudSoil_N_ST.zw;
			o.Normal = UnpackNormal( tex2D( _T_MudSoil_N, uv_T_MudSoil_N ) );
			float2 uv_T_MudSoil_BC = i.uv_texcoord * _T_MudSoil_BC_ST.xy + _T_MudSoil_BC_ST.zw;
			o.Albedo = tex2D( _T_MudSoil_BC, uv_T_MudSoil_BC ).rgb;
			float2 uv_T_MudSoil_R = i.uv_texcoord * _T_MudSoil_R_ST.xy + _T_MudSoil_R_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _T_MudSoil_R, uv_T_MudSoil_R ) ).r;
			float2 uv_T_MudSoil_AO = i.uv_texcoord * _T_MudSoil_AO_ST.xy + _T_MudSoil_AO_ST.zw;
			o.Occlusion = tex2D( _T_MudSoil_AO, uv_T_MudSoil_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
104;381;1918;1016;1571.745;109.3981;1.17546;True;True
Node;AmplifyShaderEditor.SamplerNode;1;-639.4958,241.6945;Float;True;Property;_T_MudSoil_R;T_MudSoil_R;0;0;Create;True;0;0;False;0;97fb431918503d349becd6b3af9c400c;97fb431918503d349becd6b3af9c400c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;5;-280.9272,302.4782;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;2;-692.0756,389.5187;Float;True;Property;_T_MudSoil_AO;T_MudSoil_AO;1;0;Create;True;0;0;False;0;18e643bc5c7e22b48bccd483a69ad90b;18e643bc5c7e22b48bccd483a69ad90b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-457.3357,-13.0017;Float;True;Property;_T_MudSoil_N;T_MudSoil_N;3;0;Create;True;0;0;False;0;05efbbf9afdacef44a2db2cd3e7102cd;05efbbf9afdacef44a2db2cd3e7102cd;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-466.7769,-236.9104;Float;True;Property;_T_MudSoil_BC;T_MudSoil_BC;2;0;Create;True;0;0;False;0;16021b951f748804b92d1c1ae916b0f9;16021b951f748804b92d1c1ae916b0f9;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;1;0
WireConnection;0;0;3;0
WireConnection;0;1;4;0
WireConnection;0;4;5;0
WireConnection;0;5;2;0
ASEEND*/
//CHKSM=394A7EF76E1B6344D2CB7CA416543A39DFAA2E04