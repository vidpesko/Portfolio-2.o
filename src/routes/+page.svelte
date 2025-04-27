<script>
    import { page } from '$app/stores';

    let sectionFocus = $derived($page.url.hash);

    let mouseX = $state(0);
    let mouseY = $state(0);

    function handleMouseMove(event) {
        mouseX = event.clientX;
        mouseY = event.clientY;
    }
</script>


<div class="bg-background min-h-screen text-slate-400 relative" onpointermove={(event) => {handleMouseMove(event)}}>
    <!-- Cursor gradient -->
    <div class="fixed z-30 pointer-events-none h-screen w-screen" style="background-image: radial-gradient(600px at {mouseX}px {mouseY}px, rgba(29, 78, 216, 0.15), transparent 80%);">
    </div>

    <!-- Outer container -->
    <div class="max-w-6xl mx-auto flex justify-between font-primary min-h-screen">
        <!-- Left side / personal info -->
        <header class="sticky w-1/2 top-0 flex flex-col justify-between h-screen pt-24 pb-16">
            <div class="">
                <h1 class="text-5xl font-bold tracking-tight text-slate-200">Vid Pesko</h1>
                <h2 class="text-xl mt-3 text-slate-200 tracking-tight">Programer</h2>
                <p class="max-w-xs mt-4">Lorem ipsumr, dolor sit amet consectetur adipisicing elit. Voluptates, saepe!</p>

                <nav class="mt-16 nav">
                    <ul>
                        <li>
                            <a href="#omeni" class="nav-link group {(sectionFocus === '#omeni') || (sectionFocus === '')  ? 'active' : ''}">
                                <span class="nav-indicator"></span>
                                <span class="nav-text">O meni</span>
                            </a>
                        </li>
                        <li>
                            <a href="#projekti" class="nav-link group {sectionFocus === '#projekti'  ? 'active' : ''}">
                                <span class="nav-indicator"></span>
                                <span class="nav-text">Projekti</span>
                            </a>
                        </li>
                        <li>
                            <a href="#izkusnje" class="nav-link group {sectionFocus === '#izkusnje'  ? 'active' : ''}">
                                <span class="nav-indicator"></span>
                                <span class="nav-text">Izkušnje</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="">
                <ul class="social-icons">
                    <li>
                        <!-- svelte-ignore a11y_invalid_attribute -->
                        <a href="">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8" viewBox="0 0 24 24"><!-- Icon from Material Line Icons by Vjacheslav Trushkin - https://github.com/cyberalien/line-md/blob/master/license.txt --><mask id="lineMdGithubLoop0" width="24" height="24" x="0" y="0"><g fill="#fff"><ellipse cx="9.5" cy="9" rx="1.5" ry="1"/><ellipse cx="14.5" cy="9" rx="1.5" ry="1"/></g></mask><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path stroke-dasharray="32" stroke-dashoffset="32" d="M12 4c1.67 0 2.61 0.4 3 0.5c0.53 -0.43 1.94 -1.5 3.5 -1.5c0.34 1 0.29 2.22 0 3c0.75 1 1 2 1 3.5c0 2.19 -0.48 3.58 -1.5 4.5c-1.02 0.92 -2.11 1.37 -3.5 1.5c0.65 0.54 0.5 1.87 0.5 2.5c0 0.73 0 3 0 3M12 4c-1.67 0 -2.61 0.4 -3 0.5c-0.53 -0.43 -1.94 -1.5 -3.5 -1.5c-0.34 1 -0.29 2.22 0 3c-0.75 1 -1 2 -1 3.5c0 2.19 0.48 3.58 1.5 4.5c1.02 0.92 2.11 1.37 3.5 1.5c-0.65 0.54 -0.5 1.87 -0.5 2.5c0 0.73 0 3 0 3"><animate fill="freeze" attributeName="stroke-dashoffset" dur="0.7s" values="32;0"/></path><path stroke-dasharray="10" stroke-dashoffset="10" d="M9 19c-1.406 0-2.844-.563-3.688-1.188C4.47 17.188 4.22 16.157 3 15.5"><animate attributeName="d" dur="3s" repeatCount="indefinite" values="M9 19c-1.406 0-2.844-.563-3.688-1.188C4.47 17.188 4.22 16.157 3 15.5;M9 19c-1.406 0-3-.5-4-.5-.532 0-1 0-2-.5;M9 19c-1.406 0-2.844-.563-3.688-1.188C4.47 17.188 4.22 16.157 3 15.5"/><animate fill="freeze" attributeName="stroke-dashoffset" begin="0.8s" dur="0.2s" values="10;0"/></path></g><rect width="8" height="4" x="8" y="11" fill="currentColor" mask="url(#lineMdGithubLoop0)"><animate attributeName="y" dur="10s" keyTimes="0;0.45;0.46;0.54;0.55;1" repeatCount="indefinite" values="11;11;7;7;11;11"/></rect></svg>
                        </a>
                    </li>
                    <li>
                        <!-- svelte-ignore a11y_invalid_attribute -->
                        <a href="">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8" viewBox="0 0 24 24"><!-- Icon from Material Line Icons by Vjacheslav Trushkin - https://github.com/cyberalien/line-md/blob/master/license.txt --><circle cx="17" cy="7" r="1.5" fill="currentColor" fill-opacity="0"><animate fill="freeze" attributeName="fill-opacity" begin="1.3s" dur="0.15s" values="0;1"/></circle><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path stroke-dasharray="72" stroke-dashoffset="72" d="M16 3c2.76 0 5 2.24 5 5v8c0 2.76 -2.24 5 -5 5h-8c-2.76 0 -5 -2.24 -5 -5v-8c0 -2.76 2.24 -5 5 -5h4Z"><animate fill="freeze" attributeName="stroke-dashoffset" dur="0.6s" values="72;0"/></path><path stroke-dasharray="28" stroke-dashoffset="28" d="M12 8c2.21 0 4 1.79 4 4c0 2.21 -1.79 4 -4 4c-2.21 0 -4 -1.79 -4 -4c0 -2.21 1.79 -4 4 -4"><animate fill="freeze" attributeName="stroke-dashoffset" begin="0.7s" dur="0.6s" values="28;0"/></path></g></svg>
                        </a>
                    </li>
                    <li>
                        <!-- svelte-ignore a11y_invalid_attribute -->
                        <a href="">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8" viewBox="0 0 24 24"><!-- Icon from Material Line Icons by Vjacheslav Trushkin - https://github.com/cyberalien/line-md/blob/master/license.txt --><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path stroke-dasharray="64" stroke-dashoffset="64" d="M4 5h16c0.55 0 1 0.45 1 1v12c0 0.55 -0.45 1 -1 1h-16c-0.55 0 -1 -0.45 -1 -1v-12c0 -0.55 0.45 -1 1 -1Z"><animate fill="freeze" attributeName="stroke-dashoffset" dur="0.6s" values="64;0"/></path><path stroke-dasharray="24" stroke-dashoffset="24" d="M3 6.5l9 5.5l9 -5.5"><animate fill="freeze" attributeName="stroke-dashoffset" begin="0.6s" dur="0.2s" values="24;0"/></path></g></svg>
                        </a>
                    </li>
                </ul>

                <button class="cv-btn overflow-hidden mt-4 border border-slate-400 hover:border-slate-200 px-4 py-2 rounded-lg hover:text-slate-200 transition duration-200 flex relative items-center gap-2 text-sm pe-10">
                    Prenesi CV
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 absolute right-2 top-1" viewBox="0 0 24 24"><!-- Icon from Material Symbols by Google - https://github.com/google/material-design-icons/blob/master/LICENSE --><path fill="currentColor" d="M12 15.575q-.2 0-.375-.062T11.3 15.3l-3.6-3.6q-.3-.3-.288-.7t.288-.7q.3-.3.713-.312t.712.287L11 12.15V5q0-.425.288-.712T12 4t.713.288T13 5v7.15l1.875-1.875q.3-.3.713-.288t.712.313q.275.3.288.7t-.288.7l-3.6 3.6q-.15.15-.325.213t-.375.062M6 20q-.825 0-1.412-.587T4 18v-2q0-.425.288-.712T5 15t.713.288T6 16v2h12v-2q0-.425.288-.712T19 15t.713.288T20 16v2q0 .825-.587 1.413T18 20z"/></svg>
                </button>
            </div>
        </header>
        <!-- Right side / description, projects, etc. -->
        <main class="py-24 w-1/2">
            <!-- About me -->
            <section id="omeni" class="flex flex-col gap-6 leading-7">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Cumque quibusdam inventore omnis odit qui, similique optio non, rem, vero porro aliquid. Similique blanditiis sed minima est? Iusto nostrum explicabo voluptatibus.</p>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Cumque quibusdam inventore omnis odit qui, similique optio non, rem, vero porro aliquid. Similique blanditiis sed minima est? Iusto nostrum explicabo voluptatibus.</p>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Cumque quibusdam inventore omnis odit qui, similique optio non, rem, vero porro aliquid. Similique blanditiis sed minima est? Iusto nostrum explicabo voluptatibus. Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem pariatur, repellat dignissimos aperiam, doloribus amet inventore nesciunt unde deleniti impedit, recusandae facere. Doloremque eos sapiente fugiat amet ratione ad dolorum. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
            </section>
            <!-- Experience -->
            <section id="izkusnje" class="mt-20">
                <div class="experience">
                    <!-- Time range -->
                    <div class="">
                        <p class="flex items-center text-sm">20218 <span class="h-px w-4 bg-slate-400 mx-2"></span> 2020</p>
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
                        </ul>
                    </div>
                </div>
            </section>

            <section id="projekti" class="h-96"></section>
        </main>
    </div>
</div>