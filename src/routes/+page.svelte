<script>
    import KolektorLogo from '$lib/static/images/kolektor-etra.png';
    import JazImg from '$lib/static/images/jaz.jpg';

    import { page } from '$app/stores';
    import { onMount } from 'svelte';

    let sectionFocus = $derived($page.url.hash);

    let mouseX = $state(0);
    let mouseY = $state(0);

    function handleMouseMove(event) {
        mouseX = event.clientX;
        mouseY = event.clientY;
    }

    onMount(() => {
        // Code for highlightning the active section in the navigation
        const sections = document.querySelectorAll("section");

        const observer = new IntersectionObserver(
        entries => {
            entries.forEach(entry => {
            const id = entry.target.getAttribute("id");
            if (entry.isIntersecting) {
                sectionFocus = `#${id}`;
            }
            });
        },
        {
            root: null,
            threshold: 0.9 // Adjust as needed (60% visible = active)
        }
        );

        sections.forEach(section => observer.observe(section));

        return () => {};
    });
</script>

<svelte:head>
    <title>Vid Pesko</title>
</svelte:head>


<div class="bg-background min-h-screen text-slate-400 relative" onpointermove={(event) => {handleMouseMove(event)}}>
    <!-- Cursor gradient -->
    <div class="fixed z-30 pointer-events-none h-screen w-screen" style="background-image: radial-gradient(600px at {mouseX}px {mouseY}px, rgba(29, 78, 216, 0.15), transparent 80%);">
    </div>

    <!-- Outer container -->
    <div class="max-w-7xl mx-auto flex justify-between font-primary min-h-screen">
        <!-- Left side / personal info -->
        <header class="sticky w-1/3 top-0 flex flex-col justify-between h-screen pt-24 pb-16">
            <div class="">
                <h1 class="text-5xl font-bold tracking-tight text-slate-200">Vid Pesko</h1>
                <h2 class="text-xl mt-3 text-slate-200 tracking-tight">Programer</h2>
                <p class="max-w-xs mt-4">Mladi programer</p>
                <!-- Personal info -->
                <ul class="mt-8 text-sm personal-info">
                    <li>
                        <a href="tel:+38664182101" class="flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-primary" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="M19.95 21q-3.225 0-6.287-1.438t-5.425-3.8q-2.363-2.362-3.8-5.425T3 4.05q0-.45.3-.75t.75-.3H8.1q.35 0 .625.225t.325.575l.65 3.5q.05.35-.013.638T9.4 8.45L6.975 10.9q1.05 1.8 2.638 3.375T13.1 17l2.35-2.35q.225-.225.588-.338t.712-.062l3.45.7q.35.075.575.338T21 15.9v4.05q0 .45-.3.75t-.75.3ZM6.025 9l1.65-1.65L7.25 5H5.025q.125 1.025.35 2.025T6.025 9ZM19 18.95v-2.2l-2.35-.475l-1.675 1.675q.975.425 1.987.675T19 18.95Zm-4-1.025ZM6.025 9Z"/></svg>
                            064 182 101 
                        </a>
                    </li>
                    <li class="my-2">
                        <a href="mailto:vid@pesko.si" class="flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-primary" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="M4 20q-.825 0-1.412-.587T2 18V6q0-.825.588-1.412T4 4h16q.825 0 1.413.588T22 6v12q0 .825-.587 1.413T20 20zM20 8l-7.475 4.675q-.125.075-.262.113t-.263.037t-.262-.037t-.263-.113L4 8v10h16zm-8 3l8-5H4zM4 8v.25v-1.475v.025V6v.8v-.012V8.25zv10z"/></svg>
                            vid@pesko.si
                        </a>
                    </li>
                    <li>
                        <p class="flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-primary" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="M6 19h3v-5q0-.425.288-.712T10 13h4q.425 0 .713.288T15 14v5h3v-9l-6-4.5L6 10zm-2 0v-9q0-.475.213-.9t.587-.7l6-4.5q.525-.4 1.2-.4t1.2.4l6 4.5q.375.275.588.7T20 10v9q0 .825-.588 1.413T18 21h-4q-.425 0-.712-.288T13 20v-5h-2v5q0 .425-.288.713T10 21H6q-.825 0-1.412-.587T4 19m8-6.75"/></svg>
                            Partizanska pot 17, 4000 Kranj, Slovenija
                        </p>
                    </li>
                </ul>

                <nav class="mt-16 nav">
                    <ul>
                        <li>
                            <a href="#omeni" class="nav-link group {(sectionFocus === '#omeni') || (sectionFocus === '')  ? 'active' : ''}">
                                <span class="nav-indicator"></span>
                                <span class="nav-text">O meni</span>
                            </a>
                        </li>
                        <li>
                            <a href="#izkusnje" class="nav-link group {sectionFocus === '#izkusnje'  ? 'active' : ''}">
                                <span class="nav-indicator"></span>
                                <span class="nav-text">Izkušnje</span>
                            </a>
                        </li>
                        <li>
                            <a href="#projekti" class="nav-link group {sectionFocus === '#projekti'  ? 'active' : ''}">
                                <span class="nav-indicator"></span>
                                <span class="nav-text">Projekti</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="">
                <ul class="social-icons">
                    <li>
                        <!-- svelte-ignore a11y_invalid_attribute -->
                        <a href="https://github.com/vidpesko">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" viewBox="0 0 24 24"><!-- Icon from Material Line Icons by Vjacheslav Trushkin - https://github.com/cyberalien/line-md/blob/master/license.txt --><mask id="lineMdGithubLoop0" width="24" height="24" x="0" y="0"><g fill="#fff"><ellipse cx="9.5" cy="9" rx="1.5" ry="1"/><ellipse cx="14.5" cy="9" rx="1.5" ry="1"/></g></mask><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path stroke-dasharray="32" stroke-dashoffset="32" d="M12 4c1.67 0 2.61 0.4 3 0.5c0.53 -0.43 1.94 -1.5 3.5 -1.5c0.34 1 0.29 2.22 0 3c0.75 1 1 2 1 3.5c0 2.19 -0.48 3.58 -1.5 4.5c-1.02 0.92 -2.11 1.37 -3.5 1.5c0.65 0.54 0.5 1.87 0.5 2.5c0 0.73 0 3 0 3M12 4c-1.67 0 -2.61 0.4 -3 0.5c-0.53 -0.43 -1.94 -1.5 -3.5 -1.5c-0.34 1 -0.29 2.22 0 3c-0.75 1 -1 2 -1 3.5c0 2.19 0.48 3.58 1.5 4.5c1.02 0.92 2.11 1.37 3.5 1.5c-0.65 0.54 -0.5 1.87 -0.5 2.5c0 0.73 0 3 0 3"><animate fill="freeze" attributeName="stroke-dashoffset" dur="0.7s" values="32;0"/></path><path stroke-dasharray="10" stroke-dashoffset="10" d="M9 19c-1.406 0-2.844-.563-3.688-1.188C4.47 17.188 4.22 16.157 3 15.5"><animate attributeName="d" dur="3s" repeatCount="indefinite" values="M9 19c-1.406 0-2.844-.563-3.688-1.188C4.47 17.188 4.22 16.157 3 15.5;M9 19c-1.406 0-3-.5-4-.5-.532 0-1 0-2-.5;M9 19c-1.406 0-2.844-.563-3.688-1.188C4.47 17.188 4.22 16.157 3 15.5"/><animate fill="freeze" attributeName="stroke-dashoffset" begin="0.8s" dur="0.2s" values="10;0"/></path></g><rect width="8" height="4" x="8" y="11" fill="currentColor" mask="url(#lineMdGithubLoop0)"><animate attributeName="y" dur="10s" keyTimes="0;0.45;0.46;0.54;0.55;1" repeatCount="indefinite" values="11;11;7;7;11;11"/></rect></svg>
                        </a>
                    </li>
                    <li>
                        <!-- svelte-ignore a11y_invalid_attribute -->
                        <a href="https://www.instagram.com/vidpesko/">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" viewBox="0 0 24 24"><!-- Icon from Material Line Icons by Vjacheslav Trushkin - https://github.com/cyberalien/line-md/blob/master/license.txt --><circle cx="17" cy="7" r="1.5" fill="currentColor" fill-opacity="0"><animate fill="freeze" attributeName="fill-opacity" begin="1.3s" dur="0.15s" values="0;1"/></circle><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path stroke-dasharray="72" stroke-dashoffset="72" d="M16 3c2.76 0 5 2.24 5 5v8c0 2.76 -2.24 5 -5 5h-8c-2.76 0 -5 -2.24 -5 -5v-8c0 -2.76 2.24 -5 5 -5h4Z"><animate fill="freeze" attributeName="stroke-dashoffset" dur="0.6s" values="72;0"/></path><path stroke-dasharray="28" stroke-dashoffset="28" d="M12 8c2.21 0 4 1.79 4 4c0 2.21 -1.79 4 -4 4c-2.21 0 -4 -1.79 -4 -4c0 -2.21 1.79 -4 4 -4"><animate fill="freeze" attributeName="stroke-dashoffset" begin="0.7s" dur="0.6s" values="28;0"/></path></g></svg>
                        </a>
                    </li>
                    <li>
                        <!-- svelte-ignore a11y_invalid_attribute -->
                        <a href="mailto:vid@pesko.si">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" viewBox="0 0 24 24"><!-- Icon from Material Line Icons by Vjacheslav Trushkin - https://github.com/cyberalien/line-md/blob/master/license.txt --><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path stroke-dasharray="64" stroke-dashoffset="64" d="M4 5h16c0.55 0 1 0.45 1 1v12c0 0.55 -0.45 1 -1 1h-16c-0.55 0 -1 -0.45 -1 -1v-12c0 -0.55 0.45 -1 1 -1Z"><animate fill="freeze" attributeName="stroke-dashoffset" dur="0.6s" values="64;0"/></path><path stroke-dasharray="24" stroke-dashoffset="24" d="M3 6.5l9 5.5l9 -5.5"><animate fill="freeze" attributeName="stroke-dashoffset" begin="0.6s" dur="0.2s" values="24;0"/></path></g></svg>
                        </a>
                    </li>
                </ul>

                <a href="" class="cv-btn overflow-hidden mt-2 border border-slate-400 hover:border-slate-200 px-4 py-1.5 rounded-lg hover:text-slate-200 transition duration-200 flex relative items-center gap-2 text-sm pe-10 cursor-pointer w-fit">
                    Prenesi CV
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 absolute right-2 top-1" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="M12 15.575q-.2 0-.375-.062T11.3 15.3l-3.6-3.6q-.3-.3-.288-.7t.288-.7q.3-.3.713-.312t.712.287L11 12.15V5q0-.425.288-.712T12 4t.713.288T13 5v7.15l1.875-1.875q.3-.3.713-.288t.712.313q.275.3.288.7t-.288.7l-3.6 3.6q-.15.15-.325.213t-.375.062M6 20q-.825 0-1.412-.587T4 18v-2q0-.425.288-.712T5 15t.713.288T6 16v2h12v-2q0-.425.288-.712T19 15t.713.288T20 16v2q0 .825-.587 1.413T18 20z"/></svg>
                </a>
            </div>
        </header>
        <!-- Right side / description, projects, etc. -->
        <main class="py-24 w-2/3">
            <!-- About me -->
            <section id="omeni" class="">
                <h2 class="title">
                    <span>01.</span>
                    O Meni
                </h2>
                <div class="flex gap-6">
                    <div class="flex flex-col gap-6 leading-7 w-2/3">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Cumque quibusdam inventore omnis odit qui, similique optio non, rem, vero porro aliquid. Similique blanditiis sed minima est? Iusto nostrum explicabo voluptatibus.</p>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Cumque quibusdam inventore omnis odit qui, similique optio non, rem, vero porro aliquid. Similique blanditiis sed minima est? Iusto nostrum explicabo voluptatibus.</p>
                    </div>
                    <div class="relative w-1/3 group">
                        <div class="w-full h-full border-primary border-4 rounded-lg absolute top-4 left-4 z-10 group-hover:top-0 group-hover:left-0 transition-all duration-200"></div>
                        <img src={JazImg} alt="Jaz" class="rounded-lg w-full z-30 relative group-hover:translate-x-4 group-hover:-translate-y-4 transition-transform duration-200">
                    </div>
                </div>
                <!-- Skills -->
                <div class="grid grid-cols-3 gap-y-4 w-2/3">
                    <div class="">
                        <p class="text-slate-200 flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" viewBox="0 0 32 32"><!-- Icon from VSCode Icons by Roberto Huertas - https://github.com/vscode-icons/vscode-icons/blob/master/LICENSE --><defs><linearGradient id="vscodeIconsFileTypePython0" x1="-133.268" x2="-133.198" y1="-202.91" y2="-202.84" gradientTransform="matrix(189.38 0 0 189.81 25243.061 38519.17)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#387eb8"/><stop offset="1" stop-color="#366994"/></linearGradient><linearGradient id="vscodeIconsFileTypePython1" x1="-133.575" x2="-133.495" y1="-203.203" y2="-203.133" gradientTransform="matrix(189.38 0 0 189.81 25309.061 38583.42)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#ffe052"/><stop offset="1" stop-color="#ffc331"/></linearGradient></defs><path fill="url(#vscodeIconsFileTypePython0)" d="M15.885 2.1c-7.1 0-6.651 3.07-6.651 3.07v3.19h6.752v1H6.545S2 8.8 2 16.005s4.013 6.912 4.013 6.912H8.33v-3.361s-.13-4.013 3.9-4.013h6.762s3.772.06 3.772-3.652V5.8s.572-3.712-6.842-3.712Zm-3.732 2.137a1.214 1.214 0 1 1-1.183 1.244v-.02a1.214 1.214 0 0 1 1.214-1.214Z"/><path fill="url(#vscodeIconsFileTypePython1)" d="M16.085 29.91c7.1 0 6.651-3.08 6.651-3.08v-3.18h-6.751v-1h9.47S30 23.158 30 15.995s-4.013-6.912-4.013-6.912H23.64V12.4s.13 4.013-3.9 4.013h-6.765S9.2 16.356 9.2 20.068V26.2s-.572 3.712 6.842 3.712h.04Zm3.732-2.147A1.214 1.214 0 1 1 21 26.519v.03a1.214 1.214 0 0 1-1.214 1.214z"/></svg>
                            Python
                        </p>
                        <div class="flex mt-1">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m8.85 16.825l3.15-1.9l3.15 1.925l-.825-3.6l2.775-2.4l-3.65-.325l-1.45-3.4l-1.45 3.375l-3.65.325l2.775 2.425zm3.15.45l-4.15 2.5q-.275.175-.575.15t-.525-.2t-.35-.437t-.05-.588l1.1-4.725L3.775 10.8q-.25-.225-.312-.513t.037-.562t.3-.45t.55-.225l4.85-.425l1.875-4.45q.125-.3.388-.45t.537-.15t.537.15t.388.45l1.875 4.45l4.85.425q.35.05.55.225t.3.45t.038.563t-.313.512l-3.675 3.175l1.1 4.725q.075.325-.05.588t-.35.437t-.525.2t-.575-.15zm0-5.025"/></svg>
                        </div>
                    </div>
                    <div class="">
                        <p class="text-slate-200 flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" viewBox="0 0 128 128"><!-- Icon from Devicon by konpa - https://github.com/devicons/devicon/blob/master/LICENSE --><path fill="#F0DB4F" d="M1.408 1.408h125.184v125.185H1.408z"/><path fill="#323330" d="M116.347 96.736c-.917-5.711-4.641-10.508-15.672-14.981c-3.832-1.761-8.104-3.022-9.377-5.926c-.452-1.69-.512-2.642-.226-3.665c.821-3.32 4.784-4.355 7.925-3.403c2.023.678 3.938 2.237 5.093 4.724c5.402-3.498 5.391-3.475 9.163-5.879c-1.381-2.141-2.118-3.129-3.022-4.045c-3.249-3.629-7.676-5.498-14.756-5.355l-3.688.477c-3.534.893-6.902 2.748-8.877 5.235c-5.926 6.724-4.236 18.492 2.975 23.335c7.104 5.332 17.54 6.545 18.873 11.531c1.297 6.104-4.486 8.08-10.234 7.378c-4.236-.881-6.592-3.034-9.139-6.949c-4.688 2.713-4.688 2.713-9.508 5.485c1.143 2.499 2.344 3.63 4.26 5.795c9.068 9.198 31.76 8.746 35.83-5.176c.165-.478 1.261-3.666.38-8.581M69.462 58.943H57.753l-.048 30.272c0 6.438.333 12.34-.714 14.149c-1.713 3.558-6.152 3.117-8.175 2.427c-2.059-1.012-3.106-2.451-4.319-4.485c-.333-.584-.583-1.036-.667-1.071l-9.52 5.83c1.583 3.249 3.915 6.069 6.902 7.901c4.462 2.678 10.459 3.499 16.731 2.059c4.082-1.189 7.604-3.652 9.448-7.401c2.666-4.915 2.094-10.864 2.07-17.444c.06-10.735.001-21.468.001-32.237"/></svg>
                            JavaScript
                        </p>
                        <div class="flex mt-1">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m8.85 16.825l3.15-1.9l3.15 1.925l-.825-3.6l2.775-2.4l-3.65-.325l-1.45-3.4l-1.45 3.375l-3.65.325l2.775 2.425zm3.15.45l-4.15 2.5q-.275.175-.575.15t-.525-.2t-.35-.437t-.05-.588l1.1-4.725L3.775 10.8q-.25-.225-.312-.513t.037-.562t.3-.45t.55-.225l4.85-.425l1.875-4.45q.125-.3.388-.45t.537-.15t.537.15t.388.45l1.875 4.45l4.85.425q.35.05.55.225t.3.45t.038.563t-.313.512l-3.675 3.175l1.1 4.725q.075.325-.05.588t-.35.437t-.525.2t-.575-.15zm0-5.025"/></svg>
                        </div>
                    </div>
                    <div class="">
                        <p class="text-slate-200 flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" viewBox="0 0 128 128"><!-- Icon from Devicon by konpa - https://github.com/devicons/devicon/blob/master/LICENSE --><path fill="#E44D26" d="M19.037 113.876L9.032 1.661h109.936l-10.016 112.198l-45.019 12.48z"/><path fill="#F16529" d="m64 116.8l36.378-10.086l8.559-95.878H64z"/><path fill="#EBEBEB" d="M64 52.455H45.788L44.53 38.361H64V24.599H29.489l.33 3.692l3.382 37.927H64zm0 35.743l-.061.017l-15.327-4.14l-.979-10.975H33.816l1.928 21.609l28.193 7.826l.063-.017z"/><path fill="#fff" d="M63.952 52.455v13.763h16.947l-1.597 17.849l-15.35 4.143v14.319l28.215-7.82l.207-2.325l3.234-36.233l.335-3.696h-3.708zm0-27.856v13.762h33.244l.276-3.092l.628-6.978l.329-3.692z"/></svg>
                            HTML & CSS
                        </p>
                        <div class="flex mt-1">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m8.85 16.825l3.15-1.9l3.15 1.925l-.825-3.6l2.775-2.4l-3.65-.325l-1.45-3.4l-1.45 3.375l-3.65.325l2.775 2.425zm3.15.45l-4.15 2.5q-.275.175-.575.15t-.525-.2t-.35-.437t-.05-.588l1.1-4.725L3.775 10.8q-.25-.225-.312-.513t.037-.562t.3-.45t.55-.225l4.85-.425l1.875-4.45q.125-.3.388-.45t.537-.15t.537.15t.388.45l1.875 4.45l4.85.425q.35.05.55.225t.3.45t.038.563t-.313.512l-3.675 3.175l1.1 4.725q.075.325-.05.588t-.35.437t-.525.2t-.575-.15zm0-5.025"/></svg>
                        </div>
                    </div>
                    <div class="">
                        <p class="text-slate-200 flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" viewBox="0 0 32 32"><!-- Icon from VSCode Icons by Roberto Huertas - https://github.com/vscode-icons/vscode-icons/blob/master/LICENSE --><path fill="#ffda44" d="M8.562 15.256A21.2 21.2 0 0 0 16 16.449a21.2 21.2 0 0 0 7.438-1.194c1.864-.727 2.525-1.535 2.525-2V9.7a10.4 10.4 0 0 1-2.084 1.076A22.3 22.3 0 0 1 16 12.078a22.4 22.4 0 0 1-7.879-1.3A10.3 10.3 0 0 1 6.037 9.7v3.55c0 .474.663 1.278 2.525 2.006m0 6.705a15.6 15.6 0 0 0 2.6.741a25 25 0 0 0 4.838.453a25 25 0 0 0 4.838-.452a15.6 15.6 0 0 0 2.6-.741c1.864-.727 2.525-1.535 2.525-2v-3.39a10.7 10.7 0 0 1-1.692.825A23.5 23.5 0 0 1 16 18.74a23.5 23.5 0 0 1-8.271-1.348a11 11 0 0 1-1.692-.825v3.393c0 .466.663 1.271 2.525 2.001M16 30c5.5 0 9.963-1.744 9.963-3.894v-2.837a10.5 10.5 0 0 1-1.535.762l-.157.063A23.5 23.5 0 0 1 16 25.445a23.4 23.4 0 0 1-8.271-1.351l-.157-.063a10.5 10.5 0 0 1-1.535-.762v2.837C6.037 28.256 10.5 30 16 30"/><ellipse cx="16" cy="5.894" fill="#ffda44" rx="9.963" ry="3.894"/></svg>
                            SQL
                        </p>
                        <div class="flex mt-1">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m8.85 16.825l3.15-1.9l3.15 1.925l-.825-3.6l2.775-2.4l-3.65-.325l-1.45-3.4l-1.45 3.375l-3.65.325l2.775 2.425zm3.15.45l-4.15 2.5q-.275.175-.575.15t-.525-.2t-.35-.437t-.05-.588l1.1-4.725L3.775 10.8q-.25-.225-.312-.513t.037-.562t.3-.45t.55-.225l4.85-.425l1.875-4.45q.125-.3.388-.45t.537-.15t.537.15t.388.45l1.875 4.45l4.85.425q.35.05.55.225t.3.45t.038.563t-.313.512l-3.675 3.175l1.1 4.725q.075.325-.05.588t-.35.437t-.525.2t-.575-.15zm0-5.025"/></svg>
                        </div>
                    </div>
                    <div class="">
                        <p class="text-slate-200 flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" viewBox="0 0 16 16"><!-- Icon from Codicons by Microsoft Corporation - https://github.com/microsoft/vscode-codicons/blob/main/LICENSE --><g fill="currentColor"><path d="m10.875 7l2.008 5h-.711l-2.008-5zm-5.125.594q-.414 0-.75.125a1.54 1.54 0 0 0-.578.375q-.243.25-.375.61a2.4 2.4 0 0 0-.133.827q0 .43.117.781t.352.594q.234.243.57.383q.337.14.766.133a2.6 2.6 0 0 0 .992-.195l.125.484a2 2 0 0 1-.492.148a4.4 4.4 0 0 1-.75.07a2.6 2.6 0 0 1-.914-.156a2.2 2.2 0 0 1-.742-.453a1.9 1.9 0 0 1-.485-.742a3.2 3.2 0 0 1-.18-1.023q0-.547.18-1t.5-.782q.32-.328.774-.507a2.7 2.7 0 0 1 1-.18q.445 0 .718.07q.274.07.399.14l-.149.493a2 2 0 0 0-.406-.14a2.4 2.4 0 0 0-.539-.055M8 8h1v1H8zm0 2h1v1H8z"/><path d="M15.5 1H.5l-.5.5v13l.5.5h15l.5-.5v-13zM15 14H1V5h14zm0-10H1V2h14z"/></g></svg>
                            Linux & CMD
                        </p>
                        <div class="flex mt-1">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-200" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m12 16.3l-3.7 2.825q-.275.225-.6.213t-.575-.188t-.387-.475t-.013-.65L8.15 13.4l-3.625-2.575q-.3-.2-.375-.525t.025-.6t.35-.488t.6-.212H9.6l1.45-4.8q.125-.35.388-.538T12 3.475t.563.188t.387.537L14.4 9h4.475q.35 0 .6.213t.35.487t.025.6t-.375.525L15.85 13.4l1.425 4.625q.125.35-.012.65t-.388.475t-.575.188t-.6-.213z"/></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="m8.85 16.825l3.15-1.9l3.15 1.925l-.825-3.6l2.775-2.4l-3.65-.325l-1.45-3.4l-1.45 3.375l-3.65.325l2.775 2.425zm3.15.45l-4.15 2.5q-.275.175-.575.15t-.525-.2t-.35-.437t-.05-.588l1.1-4.725L3.775 10.8q-.25-.225-.312-.513t.037-.562t.3-.45t.55-.225l4.85-.425l1.875-4.45q.125-.3.388-.45t.537-.15t.537.15t.388.45l1.875 4.45l4.85.425q.35.05.55.225t.3.45t.038.563t-.313.512l-3.675 3.175l1.1 4.725q.075.325-.05.588t-.35.437t-.525.2t-.575-.15zm0-5.025"/></svg>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Experience -->
            <section id="izkusnje" class="mt-20">
                <h2 class="title">
                    <span>02.</span>
                    Kje sem delal?
                </h2>
                <a class="experience custom-block" href="https://kolektor-etra.si" target="_blank">
                    <!-- Time range & img -->
                    <div class="">
                        <p class="flex items-center text-sm">20218 <span class="h-px w-4 bg-slate-400 mx-2"></span> 2020</p>

                        <img src={KolektorLogo} alt="" class="mt-4 rounded">
                    </div>
                    <!-- Company / job info -->
                    <div class="">
                        <h5 class="leading-5 text-slate-200 mb-2 flex items-center gap-2">
                            Programer · Kolektor Etra
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="M13 19q-.425 0-.712-.288T12 18v-8H4q-.425 0-.712-.288T3 9t.288-.712T4 8h9q.425 0 .713.288T14 9v9q0 .425-.288.713T13 19m5-5q-.425 0-.712-.288T17 13V5H9q-.425 0-.712-.288T8 4t.288-.712T9 3h9q.425 0 .713.288T19 4v9q0 .425-.288.713T18 14"/></svg>
                        </h5>
                        <p class="text-sm leading-normal">Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt itaque omnis, iure rerum ullam unde minima earum quidem doloribus necessitatibus qui, adipisci rem error odit. Fugit neque provident perspiciatis nobis!</p>
                        <!-- Tags -->
                        <ul class="flex items-center gap-2 mt-4 flex-wrap">
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                        </ul>
                    </div>
                </a>
                <a class="experience custom-block" href="https://kolektor-etra.si" target="_blank">
                    <!-- Time range & img -->
                    <div class="">
                        <p class="flex items-center text-sm">20218 <span class="h-px w-4 bg-slate-400 mx-2"></span> 2020</p>

                        <img src={KolektorLogo} alt="" class="mt-4 rounded">
                    </div>
                    <!-- Company / job info -->
                    <div class="">
                        <h5 class="leading-5 text-slate-200 mb-2 flex items-center gap-2">
                            Programer · Kolektor Etra
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="M13 19q-.425 0-.712-.288T12 18v-8H4q-.425 0-.712-.288T3 9t.288-.712T4 8h9q.425 0 .713.288T14 9v9q0 .425-.288.713T13 19m5-5q-.425 0-.712-.288T17 13V5H9q-.425 0-.712-.288T8 4t.288-.712T9 3h9q.425 0 .713.288T19 4v9q0 .425-.288.713T18 14"/></svg>
                        </h5>
                        <p class="text-sm leading-normal">Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt itaque omnis, iure rerum ullam unde minima earum quidem doloribus necessitatibus qui, adipisci rem error odit. Fugit neque provident perspiciatis nobis!</p>
                        <!-- Tags -->
                        <ul class="flex items-center gap-2 mt-4 flex-wrap">
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                        </ul>
                    </div>
                </a>
                <a href="/projekti" class="flex items-center gap-2 mt-6 text-slate-200 hover:text-primary transition duration-200 group">
                    Poglej celoten CV
                    <svg class="w-6 h-6 group-hover:translate-x-2 transition-transform duration-200" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 12H5m14 0-4 4m4-4-4-4"/>
                    </svg>
                </a>
            </section>
            <!-- Projects -->
            <section id="projekti" class="mt-20">
                <h2 class="title">
                    <span>03.</span>
                    Projekti
                </h2>
                <div class="project" href="https://github.com" target="_blank">
                    <!-- Image -->
                    <div class="image">
                        <a href="">
                            <img src={KolektorLogo} class="w-full rounded border border-slate-600 p-px" alt="">
                        </a>
                    </div>
                    <!-- Text -->
                    <div class="text-container">
                        <h5 class="leading-5 text-slate-200 mb-6 w-full text-3xl font-semibold">
                            Zbirka vozil
                        </h5>
                        <div class="text">
                            <p class="text-sm leading-normal">Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt itaque omnis, iure rerum ullam unde minima earum quidem doloribus necessitatibus qui, adipisci rem!</p>
                        </div>
                        <!-- Tags -->
                        <ul class="flex items-center gap-2 mt-4 flex-wrap justify-end">
                            <li class="tag">PHP</li>
                            <li class="tag">PHP</li>
                        </ul>
                        <!-- Links -->
                        <ul class="flex items-center gap-2 mt-4 flex-wrap justify-end">
                            <li class="hover:text-primary">
                                <a href="">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" viewBox="0 0 24 24"><!-- Icon from MingCute Icon by MingCute Design - https://github.com/Richard9394/MingCute/blob/main/LICENSE --><g fill="none"><path d="m12.593 23.258l-.011.002l-.071.035l-.02.004l-.014-.004l-.071-.035q-.016-.005-.024.005l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427q-.004-.016-.017-.018m.265-.113l-.013.002l-.185.093l-.01.01l-.003.011l.018.43l.005.012l.008.007l.201.093q.019.005.029-.008l.004-.014l-.034-.614q-.005-.018-.02-.022m-.715.002a.02.02 0 0 0-.027.006l-.006.014l-.034.614q.001.018.017.024l.015-.002l.201-.093l.01-.008l.004-.011l.017-.43l-.003-.012l-.01-.01z"/><path fill="currentColor" d="M6.315 6.176c-.25-.638-.24-1.367-.129-2.034a6.8 6.8 0 0 1 2.12 1.07c.28.214.647.283.989.18A9.3 9.3 0 0 1 12 5c.961 0 1.874.14 2.703.391c.342.104.709.034.988-.18a6.8 6.8 0 0 1 2.119-1.07c.111.667.12 1.396-.128 2.033c-.15.384-.075.826.208 1.14C18.614 8.117 19 9.04 19 10c0 2.114-1.97 4.187-5.134 4.818c-.792.158-1.101 1.155-.495 1.726c.389.366.629.882.629 1.456v3a1 1 0 0 0 2 0v-3c0-.57-.12-1.112-.334-1.603C18.683 15.35 21 12.993 21 10c0-1.347-.484-2.585-1.287-3.622c.21-.82.191-1.646.111-2.28c-.071-.568-.17-1.312-.57-1.756c-.595-.659-1.58-.271-2.28-.032a9 9 0 0 0-2.125 1.045A11.4 11.4 0 0 0 12 3c-.994 0-1.953.125-2.851.356a9 9 0 0 0-2.125-1.045c-.7-.24-1.686-.628-2.281.031c-.408.452-.493 1.137-.566 1.719l-.005.038c-.08.635-.098 1.462.112 2.283C3.484 7.418 3 8.654 3 10c0 2.992 2.317 5.35 5.334 6.397A4 4 0 0 0 8 17.98l-.168.034c-.717.099-1.176.01-1.488-.122c-.76-.322-1.152-1.133-1.63-1.753c-.298-.385-.732-.866-1.398-1.088a1 1 0 0 0-.632 1.898c.558.186.944 1.142 1.298 1.566c.373.448.869.916 1.58 1.218c.682.29 1.483.393 2.438.276V21a1 1 0 0 0 2 0v-3c0-.574.24-1.09.629-1.456c.607-.572.297-1.568-.495-1.726C6.969 14.187 5 12.114 5 10c0-.958.385-1.881 1.108-2.684c.283-.314.357-.756.207-1.14"/></g></svg>
                                </a>
                            </li>
                            <li class="hover:text-primary"><svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="M5 21q-.825 0-1.412-.587T3 19V5q0-.825.588-1.412T5 3h7v2H5v14h14v-7h2v7q0 .825-.587 1.413T19 21zm4.7-5.3l-1.4-1.4L17.6 5H14V3h7v7h-2V6.4z"/></svg></li>
                            
                        </ul>
                    </div>
                </div>

                <a href="/projekti" class="flex items-center gap-2 mt-6 text-slate-200 hover:text-primary transition duration-200 group">
                    Poglej vse projekte
                    <svg class="w-6 h-6 group-hover:translate-x-2 transition-transform duration-200" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 12H5m14 0-4 4m4-4-4-4"/>
                    </svg>
                </a>
            </section>

            <p class="mt-20 text-sm text-slate-500">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas fugiat fuga id sequi quo veniam ut, ea esse et distinctio adipisci, unde minima neque quibusdam maxime molestias enim, dolore vitae!
            </p>
        </main>
    </div>
</div>