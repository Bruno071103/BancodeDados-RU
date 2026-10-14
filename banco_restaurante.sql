--
-- PostgreSQL database dump
--

\restrict I2sbWBfkDN9dEAAi2GmKvBSq5fanxGBKaqQYktNQtfq6Ie6fXezZW6k6HJtR9Rq

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-10-14 13:25:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 16468)
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avaliacao (
    id_avaliacao integer NOT NULL,
    nota integer NOT NULL,
    comentario text,
    id_usuario character varying(20) NOT NULL,
    id_refeicao integer NOT NULL,
    CONSTRAINT avaliacao_nota_check CHECK (((nota >= 1) AND (nota <= 5)))
);


ALTER TABLE public.avaliacao OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16467)
-- Name: avaliacao_id_avaliacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avaliacao_id_avaliacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avaliacao_id_avaliacao_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 229
-- Name: avaliacao_id_avaliacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avaliacao_id_avaliacao_seq OWNED BY public.avaliacao.id_avaliacao;


--
-- TOC entry 220 (class 1259 OID 16386)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    tipo_vinculo character varying(50) NOT NULL,
    valor_ticket numeric(5,2) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16385)
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_id_categoria_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 219
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;


--
-- TOC entry 222 (class 1259 OID 16411)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionario (
    id_funcionario character varying(20) NOT NULL,
    nome character varying(100) NOT NULL,
    turno_trabalho character varying(30) NOT NULL
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16430)
-- Name: prato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prato (
    id_prato integer NOT NULL,
    nome_prato character varying(100) NOT NULL,
    tipo_prato character varying(50) NOT NULL
);


ALTER TABLE public.prato OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16429)
-- Name: prato_id_prato_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prato_id_prato_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prato_id_prato_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 225
-- Name: prato_id_prato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prato_id_prato_seq OWNED BY public.prato.id_prato;


--
-- TOC entry 224 (class 1259 OID 16420)
-- Name: refeicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refeicao (
    id_refeicao integer NOT NULL,
    data date NOT NULL,
    turno character varying(20) NOT NULL
);


ALTER TABLE public.refeicao OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16419)
-- Name: refeicao_id_refeicao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refeicao_id_refeicao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.refeicao_id_refeicao_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 223
-- Name: refeicao_id_refeicao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refeicao_id_refeicao_seq OWNED BY public.refeicao.id_refeicao;


--
-- TOC entry 231 (class 1259 OID 16491)
-- Name: refeicao_prato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refeicao_prato (
    id_refeicao integer NOT NULL,
    id_prato integer NOT NULL
);


ALTER TABLE public.refeicao_prato OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16440)
-- Name: ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket (
    id_ticket integer NOT NULL,
    data_hora_venda timestamp without time zone NOT NULL,
    metodo_pagamento character varying(50) NOT NULL,
    id_usuario character varying(20) NOT NULL,
    id_funcionario character varying(20) NOT NULL,
    id_refeicao integer NOT NULL
);


ALTER TABLE public.ticket OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16439)
-- Name: ticket_id_ticket_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticket_id_ticket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ticket_id_ticket_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 227
-- Name: ticket_id_ticket_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ticket_id_ticket_seq OWNED BY public.ticket.id_ticket;


--
-- TOC entry 221 (class 1259 OID 16395)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario character varying(20) NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    id_categoria integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16508)
-- Name: vw_cardapio_diario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_cardapio_diario AS
 SELECT r.data AS "Data",
    r.turno AS "Turno",
    p.nome_prato AS "Prato",
    p.tipo_prato AS "Categoria"
   FROM ((public.refeicao r
     JOIN public.refeicao_prato rp ON ((r.id_refeicao = rp.id_refeicao)))
     JOIN public.prato p ON ((rp.id_prato = p.id_prato)));


ALTER VIEW public.vw_cardapio_diario OWNER TO postgres;

--
-- TOC entry 4795 (class 2604 OID 16471)
-- Name: avaliacao id_avaliacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao ALTER COLUMN id_avaliacao SET DEFAULT nextval('public.avaliacao_id_avaliacao_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 16389)
-- Name: categoria id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 16433)
-- Name: prato id_prato; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato ALTER COLUMN id_prato SET DEFAULT nextval('public.prato_id_prato_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 16423)
-- Name: refeicao id_refeicao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refeicao ALTER COLUMN id_refeicao SET DEFAULT nextval('public.refeicao_id_refeicao_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 16443)
-- Name: ticket id_ticket; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket ALTER COLUMN id_ticket SET DEFAULT nextval('public.ticket_id_ticket_seq'::regclass);


--
-- TOC entry 4982 (class 0 OID 16468)
-- Dependencies: 230
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avaliacao (id_avaliacao, nota, comentario, id_usuario, id_refeicao) FROM stdin;
1	5	Comida excelente e bem temperada!	UENF23A123	1
2	3	A fila estava muito longa, mas a comida estava boa.	SIAPE98765	1
3	4	O frango estava ótimo.	UENF21B456	1
4	2	O peixe não estava bem temperado.	UENF23A123	2
\.


--
-- TOC entry 4972 (class 0 OID 16386)
-- Dependencies: 220
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id_categoria, tipo_vinculo, valor_ticket) FROM stdin;
1	Aluno Bolsista	0.00
2	Aluno Não Bolsista	3.00
3	Servidor	15.00
4	Visitante	17.00
\.


--
-- TOC entry 4974 (class 0 OID 16411)
-- Dependencies: 222
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.funcionario (id_funcionario, nome, turno_trabalho) FROM stdin;
F001	Maria Oliveira	Manhã
F002	José Santos	Tarde
\.


--
-- TOC entry 4978 (class 0 OID 16430)
-- Dependencies: 226
-- Data for Name: prato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prato (id_prato, nome_prato, tipo_prato) FROM stdin;
1	Arroz Branco	Guarnição Base
2	Feijão Preto	Guarnição Base
3	Frango Assado	Proteína
4	Peixe empanado	Proteína
5	Quibe de soja	Proteína Vegetariana
6	Alface e Tomate	Salada
7	Cenoura	Salada
\.


--
-- TOC entry 4976 (class 0 OID 16420)
-- Dependencies: 224
-- Data for Name: refeicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refeicao (id_refeicao, data, turno) FROM stdin;
1	2026-05-26	Almoço
2	2026-05-26	Jantar
3	2026-05-27	Almoço
\.


--
-- TOC entry 4983 (class 0 OID 16491)
-- Dependencies: 231
-- Data for Name: refeicao_prato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refeicao_prato (id_refeicao, id_prato) FROM stdin;
1	1
1	2
1	3
1	6
2	1
2	2
2	4
2	7
\.


--
-- TOC entry 4980 (class 0 OID 16440)
-- Dependencies: 228
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket (id_ticket, data_hora_venda, metodo_pagamento, id_usuario, id_funcionario, id_refeicao) FROM stdin;
1	2026-05-25 11:30:00	Cartão	UENF23A123	F001	1
2	2026-05-26 11:45:00	Dinheiro	UENF21B456	F001	1
3	2026-05-26 12:05:00	Dinheiro	SIAPE98765	F001	1
4	2026-05-26 18:30:00	Cartão	UENF23A123	F002	2
\.


--
-- TOC entry 4973 (class 0 OID 16395)
-- Dependencies: 221
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, nome, email, id_categoria) FROM stdin;
UENF23A123	Bruno Nunes	20231100025@pq.uenf.br	2
UENF21B456	Pedro Victor	20211100135@pq.uenf.br	1
SIAPE98765	Luis Mariano	delvalcura@uenf.br	3
VISIT11122	Visitante Externo	visitante@email.com	4
\.


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 229
-- Name: avaliacao_id_avaliacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.avaliacao_id_avaliacao_seq', 1, false);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 219
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 1, false);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 225
-- Name: prato_id_prato_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prato_id_prato_seq', 1, false);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 223
-- Name: refeicao_id_refeicao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refeicao_id_refeicao_seq', 1, false);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 227
-- Name: ticket_id_ticket_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_id_ticket_seq', 1, false);


--
-- TOC entry 4812 (class 2606 OID 16480)
-- Name: avaliacao avaliacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT avaliacao_pkey PRIMARY KEY (id_avaliacao);


--
-- TOC entry 4798 (class 2606 OID 16394)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 4804 (class 2606 OID 16418)
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id_funcionario);


--
-- TOC entry 4808 (class 2606 OID 16438)
-- Name: prato prato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prato
    ADD CONSTRAINT prato_pkey PRIMARY KEY (id_prato);


--
-- TOC entry 4806 (class 2606 OID 16428)
-- Name: refeicao refeicao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refeicao
    ADD CONSTRAINT refeicao_pkey PRIMARY KEY (id_refeicao);


--
-- TOC entry 4814 (class 2606 OID 16497)
-- Name: refeicao_prato refeicao_prato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refeicao_prato
    ADD CONSTRAINT refeicao_prato_pkey PRIMARY KEY (id_refeicao, id_prato);


--
-- TOC entry 4810 (class 2606 OID 16451)
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id_ticket);


--
-- TOC entry 4800 (class 2606 OID 16405)
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 4802 (class 2606 OID 16403)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4819 (class 2606 OID 16486)
-- Name: avaliacao avaliacao_id_refeicao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT avaliacao_id_refeicao_fkey FOREIGN KEY (id_refeicao) REFERENCES public.refeicao(id_refeicao);


--
-- TOC entry 4820 (class 2606 OID 16481)
-- Name: avaliacao avaliacao_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT avaliacao_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 4821 (class 2606 OID 16503)
-- Name: refeicao_prato refeicao_prato_id_prato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refeicao_prato
    ADD CONSTRAINT refeicao_prato_id_prato_fkey FOREIGN KEY (id_prato) REFERENCES public.prato(id_prato);


--
-- TOC entry 4822 (class 2606 OID 16498)
-- Name: refeicao_prato refeicao_prato_id_refeicao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refeicao_prato
    ADD CONSTRAINT refeicao_prato_id_refeicao_fkey FOREIGN KEY (id_refeicao) REFERENCES public.refeicao(id_refeicao);


--
-- TOC entry 4816 (class 2606 OID 16457)
-- Name: ticket ticket_id_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_funcionario_fkey FOREIGN KEY (id_funcionario) REFERENCES public.funcionario(id_funcionario);


--
-- TOC entry 4817 (class 2606 OID 16462)
-- Name: ticket ticket_id_refeicao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_refeicao_fkey FOREIGN KEY (id_refeicao) REFERENCES public.refeicao(id_refeicao);


--
-- TOC entry 4818 (class 2606 OID 16452)
-- Name: ticket ticket_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 4815 (class 2606 OID 16406)
-- Name: usuario usuario_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);


-- Completed on 2026-10-14 13:25:25

--
-- PostgreSQL database dump complete
--

\unrestrict I2sbWBfkDN9dEAAi2GmKvBSq5fanxGBKaqQYktNQtfq6Ie6fXezZW6k6HJtR9Rq

