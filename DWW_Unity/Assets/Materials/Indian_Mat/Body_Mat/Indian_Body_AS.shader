// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "body"
{
	Properties
	{
		_Body_Base_Color("Body_Base_Color", 2D) = "white" {}
		_Body_Mixed_AO("Body_Mixed_AO", 2D) = "white" {}
		_Body_Normal_DirectX("Body_Normal_DirectX", 2D) = "bump" {}
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

		uniform sampler2D _Body_Normal_DirectX;
		uniform float4 _Body_Normal_DirectX_ST;
		uniform sampler2D _Body_Base_Color;
		uniform float4 _Body_Base_Color_ST;
		uniform sampler2D _Body_Mixed_AO;
		uniform float4 _Body_Mixed_AO_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Body_Normal_DirectX = i.uv_texcoord * _Body_Normal_DirectX_ST.xy + _Body_Normal_DirectX_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Body_Normal_DirectX, uv_Body_Normal_DirectX ) );
			float2 uv_Body_Base_Color = i.uv_texcoord * _Body_Base_Color_ST.xy + _Body_Base_Color_ST.zw;
			o.Albedo = tex2D( _Body_Base_Color, uv_Body_Base_Color ).rgb;
			float2 uv_Body_Mixed_AO = i.uv_texcoord * _Body_Mixed_AO_ST.xy + _Body_Mixed_AO_ST.zw;
			o.Occlusion = tex2D( _Body_Mixed_AO, uv_Body_Mixed_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
-17;0;1906;1010;953;500.5;1;True;False
Node;AmplifyShaderEditor.SamplerNode;4;-300,138.5;Float;True;Property;_Body_Mixed_AO;Body_Mixed_AO;1;0;Create;True;0;0;False;0;a9f6983dad56cbf43b15a9710360c13f;a9f6983dad56cbf43b15a9710360c13f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5;-435,-135.5;Float;True;Property;_Body_Normal_DirectX;Body_Normal_DirectX;2;0;Create;True;0;0;False;0;ccdab2a5bb1242248af5034ddf2b4fe2;ccdab2a5bb1242248af5034ddf2b4fe2;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-332,-395.5;Float;True;Property;_Body_Base_Color;Body_Base_Color;0;0;Create;True;0;0;False;0;2dae35f8a10c12249ab65dcfa4f119e5;2dae35f8a10c12249ab65dcfa4f119e5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;193,-96;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;body;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;0;0;2;0
WireConnection;0;1;5;0
WireConnection;0;5;4;0
ASEEND*/
//CHKSM=C1B1D23DED37B383842162259591A1AB35B691BC